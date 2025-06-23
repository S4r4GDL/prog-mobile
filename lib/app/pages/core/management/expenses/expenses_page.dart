import 'package:educadinapi/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  List<ExpenseListDTO> _expenses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final userId = userSession.userId;
    if (userId == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      setState(() => _isLoading = true);
      final result = await _api.expenseControllerGetByUserId(userId);
      setState(() {
        _expenses =
            result?.where((expense) => expense.userId == userId).toList() ??
                [];
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar despesas: $e");
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar despesas: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _addExpense(ExpenseDTOCreateUpdate newExpense) async {
    try {
      await _api.expenseControllerCreate(newExpense);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Despesa "${newExpense.name}" adicionada com sucesso!')),
        );
      }
      _loadExpenses();
    } catch (e) {
      print("Erro ao criar despesa: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar despesa: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _deleteExpense(int id) async {
    try {
      await _api.expenseControllerRemove(id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Despesa excluída com sucesso!')),
        );
      }
      _loadExpenses();
    } catch (e) {
      print("Erro ao remover despesa: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir despesa: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _editExpense(int id, ExpenseDTOCreateUpdate updatedExpense) async {
    try {
      await _api.expenseControllerUpdate(id, updatedExpense);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Despesa "${updatedExpense.name}" atualizada com sucesso!')),
        );
      }
      _loadExpenses();
    } catch (e) {
      print("Erro ao atualizar despesa: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar despesa: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: 'Minhas Despesas',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquisar despesas',
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
                        borderSide: BorderSide(
                          color: lightColorScheme.primary,
                          width: 2,
                        ),
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
                    _showAddExpenseDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
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
                : _expenses.isEmpty
                ? const Center(
                child: Text('Nenhuma despesa encontrada.',
                    style: TextStyle(fontSize: 16, color: Colors.red)))
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return Slidable(
                  key: ValueKey(expense.id),
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => _showEditExpenseDialog(
                            context, expense),
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
                        onPressed: (_) =>
                            _showDeleteConfirmationDialog(
                                context, expense),
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Excluir',
                      ),
                    ],
                  ),
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      title: Text(
                        expense.name.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            expense.description.toString(),
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: lightColorScheme.surface,
                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),
                                child: Text(
                                  expense.category!.name.toString(),
                                  style: TextStyle(
                                    color: lightColorScheme.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${expense.expenseDate!.day}/${expense.expenseDate!.month}/${expense.expenseDate!.year}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Text(
                        'R\$ ${expense.amount!.toStringAsFixed(2).replaceAll('.', ',')}', // Formata e exibe o valor da despesa
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.redAccent, // Cor do valor da despesa
                        ),
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

  void _showAddExpenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _buildExpenseDialog(context, null),
    );
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
    showDialog(
      context: context,
      builder: (_) => _buildExpenseDialog(context, expenseMap),
    );
  }

  Widget _buildExpenseDialog(
      BuildContext context,
      Map<String, dynamic>? expense,
      ) {
    final isEditing = expense != null;
    final nameController =
    TextEditingController(text: isEditing ? expense['name'] : '');
    final descriptionController =
    TextEditingController(text: isEditing ? expense['description'] : '');
    final amountController = TextEditingController(
        text: isEditing ? expense['amount'].toString() : '');

    String selectedCategory =
    isEditing ? expense['category'] : 'Alimentação';
    DateTime selectedDate =
    isEditing ? expense['expenseDate'] : DateTime.now();

    return AlertDialog(
      title: Text(
          isEditing ? 'Editar Despesa' : 'Adicionar Despesa'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16),

            StatefulBuilder(
              builder: (BuildContext context, StateSetter setStateDropdown) {
                return DropdownButtonFormField<String>(
                  value: selectedCategory,
                  decoration: const InputDecoration(labelText: 'Categoria'),
                  items: [
                    'Alimentação',
                    'Transporte',
                    'Moradia',
                    'Educação',
                    'Lazer',
                    'Saúde',
                    'Contas',
                    'Outros',
                  ].map((category) {
                    return DropdownMenuItem(value: category, child: Text(category));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setStateDropdown(() {

                        selectedCategory = value;
                      });
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    decoration:
                    const InputDecoration(labelText: 'Valor (R\$)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(labelText: 'Data'),
                      child: Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                    ),
                  ),
                ),
              ],
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
            final expenseDTO = ExpenseDTOCreateUpdate(
              name: nameController.text,
              description: descriptionController.text,
              amount:
              double.tryParse(amountController.text.replaceAll(',', '.')) ??
                  0,
              categoryName: selectedCategory,
              expenseDate: selectedDate,
              leadTime: 1,
              userId: userSession.userId!,
              repeatable:
              ExpenseDTOCreateUpdateRepeatableEnum.DONT_REPEATS,
            );

            if (isEditing) {
              _editExpense(expense!['id'], expenseDTO);
            } else {
              _addExpense(expenseDTO);
            }

            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          child: Text(isEditing ? 'Salvar' : 'Adicionar'),
        ),
      ],
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context,
      ExpenseListDTO expense,
      ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: Text(
            'Deseja realmente excluir a despesa "${expense.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              _deleteExpense(expense.id!);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}