import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';
import 'package:educadinapi/api.dart';
import '../../../login/user_session.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final GoalControllerApi _api = GoalControllerApi();

  List<GoalListDTO> _allGoals = [];
  List<GoalListDTO> _filteredGoals = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_applyFilters);
    _fetchDataAndApplyFilters();
  }

  @override
  void dispose() {
    _searchController.removeListener(_applyFilters);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchDataAndApplyFilters() async {
    final userId = userSession.userId;
    if (userId == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    if (mounted) setState(() => _isLoading = true);

    try {
      final result = await _api.goalControllerGetByUserId(userId);
      if (mounted) {
        setState(() {
          _allGoals = result ?? [];
          _applyFilters();
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Erro ao buscar metas: $e");
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar metas: ${e.toString()}')),
        );
      }
    }
  }

  void _applyFilters() {
    List<GoalListDTO> filteredList = List.from(_allGoals);
    final String searchQuery = _searchController.text.trim().toLowerCase();

    if (searchQuery.isNotEmpty) {
      filteredList = filteredList.where((goal) =>
          goal.name.toString().toLowerCase().contains(searchQuery)).toList();
    }

    if (_startDate != null) {
      filteredList = filteredList.where((goal) {
        if (goal.goalDate == null) return false;
        final goalDate = DateTime(goal.goalDate!.year, goal.goalDate!.month, goal.goalDate!.day);
        final filterDate = DateTime(_startDate!.year, _startDate!.month, _startDate!.day);
        return goalDate.isAtSameMomentAs(filterDate) || goalDate.isAfter(filterDate);
      }).toList();
    }

    if (_endDate != null) {
      filteredList = filteredList.where((goal) {
        if (goal.goalDate == null) return false;
        final goalDate = DateTime(goal.goalDate!.year, goal.goalDate!.month, goal.goalDate!.day);
        final filterDate = DateTime(_endDate!.year, _endDate!.month, _endDate!.day);
        return goalDate.isAtSameMomentAs(filterDate) || goalDate.isBefore(filterDate);
      }).toList();
    }

    if (mounted) {
      setState(() {
        _filteredGoals = filteredList;
      });
    }
  }

  Future<void> _addGoal(GoalDTOCreate newGoal) async {
    try {
      await _api.goalControllerCreate(newGoal);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Meta "${newGoal.name}" adicionada com sucesso!')),
        );
      }
      await _fetchDataAndApplyFilters();
    } catch (e) {
      print("Erro ao criar meta: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar meta: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _editGoal(int id, GoalDTOUpdate updatedGoal) async {
    try {
      await _api.goalControllerUpdate(id, updatedGoal);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Meta "${updatedGoal.name}" atualizada com sucesso!')),
        );
      }
      await _fetchDataAndApplyFilters();
    } catch (e) {
      print("Erro ao atualizar meta: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar meta: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _updateGoalProgress(int id, double newAmountReached) async {
    try {
      final currentGoal = _allGoals.firstWhere((goal) => goal.id == id);
      final updatedGoalDTO = GoalDTOUpdate(
        name: currentGoal.name,
        amountTotal: currentGoal.amountTotal,
        amountReached: newAmountReached,
        goalDate: currentGoal.goalDate,
        userId: userSession.userId!,
      );

      await _api.goalControllerUpdate(id, updatedGoalDTO);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Progresso da meta "${currentGoal.name}" atualizado!')),
        );
      }
      await _fetchDataAndApplyFilters();
    } catch (e) {
      print("Erro ao atualizar progresso da meta: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar progresso: ${e.toString()}')),
        );
      }
    }
  }


  Future<void> _deleteGoal(int id) async {
    try {
      await _api.goalControllerRemove(id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Meta excluída com sucesso!')),
        );
      }
      await _fetchDataAndApplyFilters();
    } catch (e) {
      print("Erro ao remover meta: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir meta: ${e.toString()}')),
        );
      }
    }
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            Future<void> pickDate(bool isStartDate) async {
              final now = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context, initialDate: (isStartDate ? _startDate : _endDate) ?? now,
                firstDate: DateTime(2000), lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setModalState(() {
                  if (isStartDate) _startDate = pickedDate; else _endDate = pickedDate;
                });
              }
            }
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 80),
              child: Wrap(
                runSpacing: 24,
                children: [
                  Text('Filtrar por Período', style: Theme.of(context).textTheme.titleLarge),
                  _buildDateSelector(context, label: 'Data Início', date: _startDate, onTap: () => pickDate(true)),
                  const SizedBox(height: 16),
                  _buildDateSelector(context, label: 'Data Fim', date: _endDate, onTap: () => pickDate(false)),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setModalState(() { _startDate = null; _endDate = null; });
                            setState(() { _startDate = null; _endDate = null; });
                            _applyFilters();
                          },
                          child: const Text('Limpar Datas'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _applyFilters();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                          child: const Text('Aplicar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDateSelector(BuildContext context, {required String label, required DateTime? date, required VoidCallback onTap}) {
    return InkWell(onTap: onTap, child: InputDecorator(decoration: InputDecoration(labelText: label, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade300)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(date != null ? DateFormat('dd/MM/yy').format(date) : 'Selecione', style: TextStyle(color: date != null ? Colors.black87 : Colors.grey.shade600)), const Icon(Icons.calendar_today, size: 18)])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddGoalDialog(context),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ManageDefaultScaffold(
        title: 'Minhas Metas',
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Pesquisar por nome...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _showFilterBottomSheet,
                    icon: const Icon(Icons.tune),
                    tooltip: 'Filtros avançados',
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredGoals.isEmpty
                  ? Center(
                  child: Text('Nenhuma meta encontrada.',
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade600)))
                  : ListView.builder(
                // PADDING INFERIOR AJUSTADO PARA O BOTÃO FLUTUANTE NÃO SOBREPOR O ÚLTIMO ITEM
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                itemCount: _filteredGoals.length,
                itemBuilder: (context, index) {
                  final goal = _filteredGoals[index];
                  double progress;
                  if (goal.goalPercent != null) {
                    progress = (goal.goalPercent! / 100).clamp(0.0, 1.0);
                  } else if (goal.amountTotal != null && goal.amountTotal! > 0) {
                    progress = ((goal.amountReached ?? 0) / goal.amountTotal!).clamp(0.0, 1.0);
                  } else {
                    progress = 0.0;
                  }

                  final int displayProgress = (progress * 100).toInt().clamp(0, 100);

                  return Slidable(
                    key: ValueKey(goal.id),
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _showEditGoalDialog(context, goal),
                          backgroundColor: lightColorScheme.primary,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Editar',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(onDismissed: () => _deleteGoal(goal.id!)),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _showDeleteConfirmationDialog(context, goal),
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Excluir',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    goal.name.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    _showShareGoalDialog(context, goal);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Meta: R\$ ${goal.amountTotal?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00'}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Atual: R\$ ${goal.amountReached?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00'}',
                                      style: TextStyle(
                                        color: Colors.amber.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Prazo: ${goal.goalDate != null ? DateFormat('dd/MM/yyyy').format(goal.goalDate!) : 'N/A'}',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$displayProgress% concluído',
                                      style: TextStyle(
                                        color: Colors.amber.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                              borderRadius: BorderRadius.circular(8),
                              minHeight: 8,
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                _showUpdateProgressDialog(context, goal);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lightColorScheme.surface,
                                foregroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text('Atualizar Progresso'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildGoalDialog(context, null);
      },
    );
  }

  void _showEditGoalDialog(BuildContext context, GoalListDTO goal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildGoalDialog(context, goal);
      },
    );
  }

  Widget _buildGoalDialog(BuildContext context, GoalListDTO? goal) {
    final isEditing = goal != null;
    final nameController = TextEditingController(text: isEditing ? goal.name : '');
    final amountTotalController = TextEditingController(text: isEditing ? goal.amountTotal?.toStringAsFixed(2).replaceAll('.', ',') : '');
    final amountReachedController = TextEditingController(text: isEditing ? goal.amountReached?.toStringAsFixed(2).replaceAll('.', ',') : '0,00');

    DateTime selectedDate = isEditing && goal!.goalDate != null ? goal.goalDate! : DateTime.now().add(const Duration(days: 180));

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: Text(isEditing ? 'Editar Meta' : 'Adicionar Meta'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Nome da meta',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: amountTotalController,
                  decoration: const InputDecoration(
                    labelText: 'Valor Total da Meta (R\$)',
                    hintText: '0,00',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: amountReachedController,
                  decoration: const InputDecoration(
                    labelText: 'Valor Já Alcançado (R\$)',
                    hintText: '0,00',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Prazo',
                    ),
                    child: Text(
                      DateFormat('dd/MM/yyyy').format(selectedDate),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  final updatedGoalDTO = GoalDTOUpdate(
                    name: nameController.text,
                    amountTotal: double.tryParse(amountTotalController.text.replaceAll(',', '.')) ?? 0.0,
                    amountReached: double.tryParse(amountReachedController.text.replaceAll(',', '.')) ?? 0.0,
                    goalDate: selectedDate,
                    userId: userSession.userId!,
                  );
                  _editGoal(goal!.id!, updatedGoalDTO);
                } else {
                  final newGoalDTOCreate = GoalDTOCreate(
                    name: nameController.text,
                    amountTotal: double.tryParse(amountTotalController.text.replaceAll(',', '.')) ?? 0.0,
                    goalDate: selectedDate,
                    userId: userSession.userId!,
                  );
                  _addGoal(newGoalDTOCreate);
                }
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
              ),
              child: Text(isEditing ? 'Salvar' : 'Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateProgressDialog(BuildContext context, GoalListDTO goal) {
    final amountReachedController = TextEditingController(
        text: goal.amountReached?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atualizar Progresso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Meta: ${goal.name}'),
              const SizedBox(height: 16),
              TextField(
                controller: amountReachedController,
                decoration: const InputDecoration(
                  labelText: 'Novo Valor Alcançado (R\$)',
                  hintText: '0,00',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final newAmountReached = double.tryParse(amountReachedController.text.replaceAll(',', '.')) ?? 0.0;
                _updateGoalProgress(goal.id!, newAmountReached);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white
              ),
              child: const Text('Atualizar'),
            ),
          ],
        );
      },
    );
  }

  void _showShareGoalDialog(BuildContext context, GoalListDTO goal) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Compartilhar Meta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meta: ${goal.name}'),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite o email para compartilhar',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Compartilhando "${goal.name}" com ${emailController.text}')),
                );
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white
              ),
              child: const Text('Compartilhar'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, GoalListDTO goal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text('Deseja realmente excluir a meta "${goal.name}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteGoal(goal.id!);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white
              ),
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}