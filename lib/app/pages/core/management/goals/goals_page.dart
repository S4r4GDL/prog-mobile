import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  List<GoalListDTO> _goals = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    final userId = userSession.userId;
    if (userId == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      setState(() => _isLoading = true);
      final result = await _api.goalControllerGetByUserId(userId);
      setState(() {
        _goals = result?.where((goal) => goal.userId == userId).toList() ?? [];
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar metas: $e");
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar metas: ${e.toString()}')),
        );
      }
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
      _loadGoals();
    } catch (e) {
      print("Erro ao criar meta: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar meta: ${e.toString()}')),
        );
      }
    }
  }

  // Mudando para GoalDTOUpdate
  Future<void> _editGoal(int id, GoalDTOUpdate updatedGoal) async {
    try {
      await _api.goalControllerUpdate(id, updatedGoal);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Meta "${updatedGoal.name}" atualizada com sucesso!')),
        );
      }
      _loadGoals();
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
      final currentGoal = _goals.firstWhere((goal) => goal.id == id);

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
      _loadGoals();
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
      _loadGoals();
    } catch (e) {
      print("Erro ao remover meta: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir meta: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: 'Minhas Metas',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquisar metas',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _showAddGoalDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightColorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 4),
                      Text('Adicionar'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _goals.isEmpty
                ? const Center(
                child: Text('Nenhuma meta encontrada.',
                    style: TextStyle(fontSize: 16, color: Colors.grey)))
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _goals.length,
              itemBuilder: (context, index) {
                final goal = _goals[index];
                // Calcula o progresso, garantindo que seja entre 0.0 e 1.0
                double progress;
                if (goal.goalPercent != null) {
                  // Se goalPercent já vier como porcentagem (ex: 50.0 para 50%), divide por 100
                  progress = (goal.goalPercent! / 100).clamp(0.0, 1.0);
                } else if (goal.amountTotal != null && goal.amountTotal! > 0) {
                  progress = ((goal.amountReached ?? 0) / goal.amountTotal!).clamp(0.0, 1.0);
                } else {
                  progress = 0.0;
                }

                // Formata o texto da porcentagem para não exceder 100%
                final int displayProgress = (progress * 100).toInt().clamp(0, 100);


                return Slidable(
                  key: ValueKey(goal.id),
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => _showEditGoalDialog(context, goal),
                        backgroundColor: lightColorScheme.primary,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => _showDeleteConfirmationDialog(context, goal),
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Excluir',
                      ),
                    ],
                  ),
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
                                  color: lightColorScheme.primary,
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
                                      color: lightColorScheme.primary,
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
                                    'Prazo: ${goal.goalDate != null ? '${goal.goalDate!.day}/${goal.goalDate!.month}/${goal.goalDate!.year}' : 'N/A'}', // Usando goalDate e tratando null
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    // Utilizando o valor de porcentagem limitado
                                    '$displayProgress% concluído',
                                    style: TextStyle(
                                      color: lightColorScheme.primary,
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
                            value: progress, // O valor do indicador é entre 0.0 e 1.0
                            backgroundColor: Colors.grey.shade200,
                            valueColor: AlwaysStoppedAnimation<Color>(lightColorScheme.primary),
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
                              foregroundColor: lightColorScheme.primary,
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


    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        DateTime selectedDate = isEditing && goal!.goalDate != null ? goal.goalDate! : DateTime.now().add(const Duration(days: 180));

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
                // Corrigido: Campo amountReached sempre visível no diálogo
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
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    ),
                  ),
                ),
              ],
            ),
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
                if (isEditing) {
                  final updatedGoalDTO = GoalDTOUpdate(
                    name: nameController.text,
                    amountTotal: double.tryParse(amountTotalController.text.replaceAll(',', '.')) ?? 0.0,
                    amountReached: double.tryParse(amountReachedController.text.replaceAll(',', '.')) ?? 0.0, // Incluído
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
                backgroundColor: lightColorScheme.primary,
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
                backgroundColor: lightColorScheme.primary,
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
                  SnackBar(content: Text('Compartilhando "${goal.name}" com ${emailController.text}... (Lógica a ser implementada)')),
                );
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColorScheme.primary,
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
              ),
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}