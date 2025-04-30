import 'package:educadinapi/api.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';
import '../../../login/user_session.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({super.key});

  @override
  State<IncomesPage> createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  // final List<Map<String, dynamic>> _incomes = [
  //   {
  //     'id': 1,
  //     'name': 'Salário',
  //     'category': 'Trabalho',
  //     'description': 'Salário mensal',
  //     'incomeDate': DateTime.now().subtract(const Duration(days: 5)),
  //     'amount': 'R\$ 3.500,00',
  //   },
  //   {
  //     'id': 2,
  //     'name': 'Freelance',
  //     'category': 'Trabalho',
  //     'description': 'Projeto de design',
  //     'incomeDate': DateTime.now().subtract(const Duration(days: 10)),
  //     'amount': 'R\$ 800,00',
  //   },
  //   {
  //     'id': 3,
  //     'name': 'Dividendos',
  //     'category': 'Investimentos',
  //     'description': 'Rendimentos de ações',
  //     'incomeDate': DateTime.now().subtract(const Duration(days: 15)),
  //     'amount': 'R\$ 250,00',
  //   },
  //   {
  //     'id': 4,
  //     'name': 'Aluguel',
  //     'category': 'Imóveis',
  //     'description': 'Aluguel do apartamento',
  //     'incomeDate': DateTime.now().subtract(const Duration(days: 2)),
  //     'amount': 'R\$ 1.200,00',
  //   },
  // ];

  final IncomeControllerApi _api = IncomeControllerApi();
  List<IncomeListDTO> _incomes = [];
  bool _isLoading = true;

  Future<void> _loadIncomes() async {
    try {
      final result = await _api.incomeControllerListAll();
      setState(() {
        print(result);
        _incomes = result?.where((income) => income.userId == userSession.userId).toList() ?? [];
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar rendimentos: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> _addIncome(newIncome) async {
    try {
      await _api.incomeControllerCreate(newIncome);
      _loadIncomes();
    } catch (e) {
      print("Erro ao criar rendimento: $e");
    }
  }

  Future<void> _deleteIncome(int id) async {
    try {
      await _api.incomeControllerRemove(id);
      _loadIncomes();
    } catch (e) {
      print("Erro ao remover rendimento: $e");
    }
  }

  Future<void> _editIncome(int id, updatedIncome) async {
    //Exemplo
    // final updatedIncome = IncomeDTOCreateUpdate(
    //   description: 'sagsedgsdrfrgdrfrg editadoooo mobile 3',
    //   amount: 100,
    //   categoryName: 'ewtg43e4r4t dfthy',
    //   leadTime: 3,
    //   incomeDate: DateTime.now(),
    //   name: 'aetuh',
    //   userId: 1,
    //   repeatable: IncomeDTOCreateUpdateRepeatableEnum.MONTHLY,
    // );
    try {
      await _api.incomeControllerUpdate(id, updatedIncome);
      _loadIncomes();
    } catch (e) {
      print("Erro ao atualizar rendimento: $e");
    }
  }

  Future<void> _viewIncome(int id) async {
    try {
      final income = await _api.incomeControllerGetById(id);
      if (income != null) {
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: Text("Detalhes do Rendimento"),
                content: Text(
                  'Descrição: ${income.description}\nValor: ${income.amount}\nRepetível: ${income.repeatable}',
                ),
              ),
        );
      }
    } catch (e) {
      print("Erro ao buscar detalhe: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadIncomes();
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
                Expanded(
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
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _incomes.length,
                      itemBuilder: (context, index) {
                        final income = _incomes[index];
                        return Card(
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
                                        borderRadius: BorderRadius.circular(12),
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
                                      '${income.incomeDate}',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                              trailing: Container(
                                width: 80, // control horizontal space to prevent overflow
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'R\$ ${income.amount?.toStringAsFixed(2).replaceAll('.', ',')}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: lightColorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: lightColorScheme.primary,
                                            size: 20,
                                          ),
                                          constraints: const BoxConstraints(),
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            _showEditIncomeDialog(context, income);
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                            size: 20,
                                          ),
                                          constraints: const BoxConstraints(),
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            _showDeleteConfirmationDialog(context, income);
                                          },
                                        ),
                                      ],
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

  void _showAddIncomeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildIncomeDialog(context, null);
      },
    );
  }

  void _showEditIncomeDialog(
    BuildContext context, IncomeListDTO income,
  ) {
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
    final nameController = TextEditingController(
      text: isEditing ? income['name'] : '',
    );
    final descriptionController = TextEditingController(
      text: isEditing ? income['description'] : '',
    );
    final amountController = TextEditingController(
      text: isEditing ? income['amount'].toString().replaceAll('R\$ ', '') : '',
    );

    String selectedCategory = isEditing ? income['category'] : 'Trabalho';
    DateTime selectedDate = isEditing ? income['incomeDate'] : DateTime.now();

    return AlertDialog(
      title: Text(isEditing ? 'Editar Renda' : 'Adicionar Renda'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Nome da renda',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(labelText: 'Categoria'),
              items:
                  [
                        'Trabalho',
                        'Investimentos',
                        'Imóveis',
                        'Presentes',
                        'Outros',
                      ]
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedCategory = value;
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: 'Descrição da receita',
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)',
                      hintText: '0,00',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      if (picked != null && picked != selectedDate) {
                        selectedDate = picked;
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(labelText: 'Data'),
                      child: Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      ),
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
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            final incomeDTO = IncomeDTOCreateUpdate(
              name: nameController.text,
              description: descriptionController.text,
              amount: double.tryParse(amountController.text.replaceAll(',', '.')) ?? 0,
              categoryName: selectedCategory,
              incomeDate: selectedDate,
              leadTime: 1,
              userId: userSession.userId!,
              repeatable: IncomeDTOCreateUpdateRepeatableEnum.DONT_REPEATS,
            );
            if (isEditing) {
              _editIncome(income!['id'], incomeDTO); // edita usando id
            } else {
              _addIncome(incomeDTO); // criação normal
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
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text(
            'Deseja realmente excluir a receita "${income.name}"?',
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
                _deleteIncome(income.id!);
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
