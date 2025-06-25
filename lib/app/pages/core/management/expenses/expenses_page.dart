import 'package:educadinapi/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';
import '../../../login/user_session.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final ExpenseControllerApi _api = ExpenseControllerApi();

  List<ExpenseListDTO> _allExpenses = [];
  List<ExpenseListDTO> _filteredExpenses = [];

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
      final result = await _api.expenseControllerGetByUserId(userId);

      if (mounted) {
        setState(() {
          _allExpenses = result ?? [];
          _applyFilters();
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Erro ao buscar despesas: $e");
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar despesas: ${e.toString()}')),
        );
      }
    }
  }

  void _applyFilters() {
    List<ExpenseListDTO> filteredList = List.from(_allExpenses);
    final String searchQuery = _searchController.text.trim().toLowerCase();

    if (searchQuery.isNotEmpty) {
      filteredList = filteredList.where((expense) =>
          expense.name.toString().toLowerCase().contains(searchQuery)).toList();
    }

    if (_startDate != null) {
      filteredList = filteredList.where((expense) {
        if (expense.expenseDate == null) return false;
        final expenseDate = DateTime(expense.expenseDate!.year, expense.expenseDate!.month, expense.expenseDate!.day);
        final filterDate = DateTime(_startDate!.year, _startDate!.month, _startDate!.day);
        return expenseDate.isAtSameMomentAs(filterDate) || expenseDate.isAfter(filterDate);
      }).toList();
    }

    if (_endDate != null) {
      filteredList = filteredList.where((expense) {
        if (expense.expenseDate == null) return false;
        final expenseDate = DateTime(expense.expenseDate!.year, expense.expenseDate!.month, expense.expenseDate!.day);
        final filterDate = DateTime(_endDate!.year, _endDate!.month, _endDate!.day);
        return expenseDate.isAtSameMomentAs(filterDate) || expenseDate.isBefore(filterDate);
      }).toList();
    }

    setState(() {
      _filteredExpenses = filteredList;
    });
  }

  Future<void> _addExpense(ExpenseDTOCreateUpdate newExpense) async {
    try {
      await _api.expenseControllerCreate(newExpense);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Despesa "${newExpense.name}" adicionada com sucesso!')));
      await _fetchDataAndApplyFilters();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao adicionar despesa: ${e.toString()}')));
    }
  }

  Future<void> _deleteExpense(int id) async {
    try {
      await _api.expenseControllerRemove(id);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Despesa excluída com sucesso!')));
      await _fetchDataAndApplyFilters();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao excluir despesa: ${e.toString()}')));
    }
  }

  Future<void> _editExpense(int id, ExpenseDTOCreateUpdate updatedExpense) async {
    try {
      await _api.expenseControllerUpdate(id, updatedExpense);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Despesa "${updatedExpense.name}" atualizada com sucesso!')));
      await _fetchDataAndApplyFilters();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao atualizar despesa: ${e.toString()}')));
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
              padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
              child: Wrap(
                runSpacing: 16,
                children: [
                  Text('Filtrar por Período', style: Theme.of(context).textTheme.titleLarge),
                  _buildDateSelector(context, label: 'Data Início', date: _startDate, onTap: () => pickDate(true)),
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
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _applyFilters();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent, foregroundColor: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddExpenseDialog(context),
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ManageDefaultScaffold(
        title: 'Minhas Despesas',
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(onPressed: _showFilterBottomSheet, icon: const Icon(Icons.tune), tooltip: 'Filtros avançados'),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredExpenses.isEmpty
                  ? Center(child: Text('Nenhuma despesa encontrada.', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)))
                  : ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                itemCount: _filteredExpenses.length,
                itemBuilder: (context, index) {
                  final expense = _filteredExpenses[index];
                  return Slidable(
                    key: ValueKey(expense.id),
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _showEditExpenseDialog(context, expense),
                          backgroundColor: lightColorScheme.primary, foregroundColor: Colors.white,
                          icon: Icons.edit, label: 'Editar', borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(onDismissed: () => _deleteExpense(expense.id!)),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _showDeleteConfirmationDialog(context, expense),
                          backgroundColor: Colors.redAccent, foregroundColor: Colors.white,
                          icon: Icons.delete, label: 'Excluir', borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        title: Text(expense.name.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(expense.category?.name?.toString() ?? 'Sem Categoria', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'R\$ ${expense.amount!.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orangeAccent),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              expense.expenseDate != null ? DateFormat('dd/MM/yyyy').format(expense.expenseDate!) : 'Sem data',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
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

  Widget _buildDateSelector(BuildContext context, {required String label, required DateTime? date, required VoidCallback onTap}) {
    return InkWell(onTap: onTap, child: InputDecorator(decoration: InputDecoration(labelText: label, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade300)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(date != null ? DateFormat('dd/MM/yy').format(date) : 'Selecione', style: TextStyle(color: date != null ? Colors.black87 : Colors.grey.shade600)), const Icon(Icons.calendar_today, size: 18)])));
  }

  void _showAddExpenseDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => _buildExpenseDialog(context, null));
  }

  void _showEditExpenseDialog(BuildContext context, ExpenseListDTO expense) {
    final expenseMap = {
      'id': expense.id,
      'name': expense.name,
      'description': expense.description,
      'amount': expense.amount,
      'category': expense.category?.name ?? '',
      'expenseDate': expense.expenseDate,
    };
    showDialog(context: context, builder: (_) => _buildExpenseDialog(context, expenseMap));
  }

  Widget _buildExpenseDialog(BuildContext context, Map<String, dynamic>? expense) {
    final isEditing = expense != null;
    final nameController = TextEditingController(text: isEditing ? expense['name'] : '');
    final descriptionController = TextEditingController(text: isEditing ? expense['description'] : '');
    final amountController = TextEditingController(text: isEditing ? expense['amount'].toString() : '');
    String selectedCategory = isEditing && (expense['category'] as String).isNotEmpty ? expense['category'] : 'Alimentação';
    DateTime selectedDate = isEditing && expense['expenseDate'] != null ? expense['expenseDate'] : DateTime.now();

    return AlertDialog(
      title: Text(isEditing ? 'Editar Despesa' : 'Adicionar Despesa'),
      content: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nome')),
          const SizedBox(height: 16),
          StatefulBuilder(builder: (BuildContext context, StateSetter setStateDropdown) {
            return DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(labelText: 'Categoria'),
              items: ['Alimentação', 'Transporte', 'Moradia', 'Educação', 'Lazer', 'Saúde', 'Contas', 'Outros']
                  .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                  .toList(),
              onChanged: (value) {
                if (value != null) setStateDropdown(() => selectedCategory = value);
              },
            );
          }),
          const SizedBox(height: 16),
          TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Descrição'), maxLines: 2),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: TextField(controller: amountController, decoration: const InputDecoration(labelText: 'Valor (R\$)'), keyboardType: const TextInputType.numberWithOptions(decimal: true))),
            const SizedBox(width: 16),
            Expanded(child: StatefulBuilder(builder: (BuildContext context, StateSetter setStateDialog) {
              return InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2020), lastDate: DateTime(2100));
                    if (picked != null && picked != selectedDate) setStateDialog(() => selectedDate = picked);
                  },
                  child: InputDecorator(decoration: const InputDecoration(labelText: 'Data'), child: Text(DateFormat('dd/MM/yyyy').format(selectedDate))));
            })),
          ]),
        ]),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () {
            final expenseDTO = ExpenseDTOCreateUpdate(
              name: nameController.text,
              description: descriptionController.text,
              amount: double.tryParse(amountController.text.replaceAll(',', '.')) ?? 0,
              categoryName: selectedCategory,
              expenseDate: selectedDate,
              leadTime: 1,
              userId: userSession.userId!,
              repeatable: ExpenseDTOCreateUpdateRepeatableEnum.DONT_REPEATS,
            );

            if (isEditing) {
              _editExpense(expense!['id'], expenseDTO);
            } else {
              _addExpense(expenseDTO);
            }
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
          child: Text(isEditing ? 'Salvar' : 'Adicionar'),
        ),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, ExpenseListDTO expense) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: Text('Deseja realmente excluir a despesa "${expense.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteExpense(expense.id!);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}