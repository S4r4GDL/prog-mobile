import 'package:educadinapi/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';
import '../../../login/user_session.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({super.key});

  @override
  State<IncomesPage> createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {

  final IncomeControllerApi _api = IncomeControllerApi();
  List<IncomeListDTO> _incomes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadIncomes();
  }

  Future<void> _loadIncomes() async {
    final userId = userSession.userId;
    if (userId == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      setState(() => _isLoading = true);
      final result = await _api.incomeControllerGetByUserId(userId);
      setState(() {
        _incomes =
            result?.where((income) => income.userId == userId).toList() ?? [];
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar receitas: $e");
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar receitas: ${e.toString()}')),
        );
      }
    }
  }


  Future<void> _addIncome(IncomeDTOCreateUpdate newIncome) async {
    try {
      await _api.incomeControllerCreate(newIncome);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Receita "${newIncome.name}" adicionada com sucesso!')),
        );
      }
      _loadIncomes();
    } catch (e) {
      print("Erro ao criar receita: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar receita: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _deleteIncome(int id) async {
    try {
      await _api.incomeControllerRemove(id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Receita excluída com sucesso!')),
        );
      }
      _loadIncomes();
    } catch (e) {
      print("Erro ao remover receita: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir receita: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _editIncome(int id, IncomeDTOCreateUpdate updatedIncome) async {
    try {
      await _api.incomeControllerUpdate(id, updatedIncome);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Receita "${updatedIncome.name}" atualizada com sucesso!')),
        );
      }
      _loadIncomes();
    } catch (e) {
      print("Erro ao atualizar receita: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar receita: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: 'Meus Ganhos',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquisar receitas',
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
                    _showAddIncomeDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightColorScheme.primary,
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
                : _incomes.isEmpty
                ? const Center(
                child: Text('Nenhuma receita encontrada.',
                    style: TextStyle(fontSize: 16, color: Colors.grey)))
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _incomes.length,
              itemBuilder: (context, index) {
                final income = _incomes[index];
                return Slidable(
                  key: ValueKey(income.id),
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => _showEditIncomeDialog(
                            context, income),
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
                                context, income),
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
                        income.name.toString(),
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
                            income.description.toString(),
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
                                  income.category!.name.toString(),
                                  style: TextStyle(
                                    color: lightColorScheme.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${income.incomeDate!.day}/${income.incomeDate!.month}/${income.incomeDate!.year}',
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
                        'R\$ ${income.amount!.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: lightColorScheme.primary,
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

  void _showAddIncomeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _buildIncomeDialog(context, null),
    );
  }

  void _showEditIncomeDialog(BuildContext context, IncomeListDTO income) {
    final incomeMap = {
      'id': income.id,
      'name': income.name,
      'description': income.description,
      'amount': income.amount,
      'category': income.category?.name ?? '',
      'incomeDate': income.incomeDate,
    };
    showDialog(
      context: context,
      builder: (_) => _buildIncomeDialog(context, incomeMap),
    );
  }

  Widget _buildIncomeDialog(
      BuildContext context,
      Map<String, dynamic>? income,
      ) {
    final isEditing = income != null;
    final nameController =
    TextEditingController(text: isEditing ? income['name'] : '');
    final descriptionController =
    TextEditingController(text: isEditing ? income['description'] : '');
    final amountController = TextEditingController(
        text: isEditing ? income['amount'].toString() : '');

    String selectedCategory =
    isEditing ? income['category'] : 'Trabalho';
    DateTime selectedDate =
    isEditing ? income['incomeDate'] : DateTime.now();

    return AlertDialog(
      title: Text(
          isEditing ? 'Editar Renda' : 'Adicionar Renda'),
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
                    'Trabalho',
                    'Investimentos',
                    'Imóveis',
                    'Presentes',
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
            final incomeDTO = IncomeDTOCreateUpdate(
              name: nameController.text,
              description: descriptionController.text,
              amount:
              double.tryParse(amountController.text.replaceAll(',', '.')) ??
                  0,
              categoryName: selectedCategory,
              incomeDate: selectedDate,
              leadTime: 1,
              userId: userSession.userId!,
              repeatable:
              IncomeDTOCreateUpdateRepeatableEnum.DONT_REPEATS,
            );

            if (isEditing) {
              _editIncome(income!['id'], incomeDTO);
            } else {
              _addIncome(incomeDTO);
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
  }

  void _showDeleteConfirmationDialog(
      BuildContext context,
      IncomeListDTO income,
      ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: Text(
            'Deseja realmente excluir a receita "${income.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              _deleteIncome(income.id!);
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