import 'package:flutter/material.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final List<Map<String, dynamic>> _expenses = [
    {
      'id': 1,
      'name': 'Aluguel',
      'category': 'Moradia',
      'description': 'Pagamento mensal do aluguel',
      'expenseDate': DateTime.now().subtract(const Duration(days: 5)),
      'amount': 'R\$ 1.200,00',
    },
    {
      'id': 2,
      'name': 'Supermercado',
      'category': 'Alimentação',
      'description': 'Compras da semana',
      'expenseDate': DateTime.now().subtract(const Duration(days: 3)),
      'amount': 'R\$ 350,00',
    },
    {
      'id': 3,
      'name': 'Combustível',
      'category': 'Transporte',
      'description': 'Abastecimento do carro',
      'expenseDate': DateTime.now().subtract(const Duration(days: 2)),
      'amount': 'R\$ 200,00',
    },
    {
      'id': 4,
      'name': 'Internet',
      'category': 'Serviços',
      'description': 'Pagamento mensal da internet',
      'expenseDate': DateTime.now().subtract(const Duration(days: 1)),
      'amount': 'R\$ 120,00',
    },
    {
      'id': 5,
      'name': 'Academia',
      'category': 'Saúde',
      'description': 'Mensalidade da academia',
      'expenseDate': DateTime.now(),
      'amount': 'R\$ 100,00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: const Text('Meus Gastos', style: TextStyle(color: Colors.white)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
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
                    //_showAddExpenseDialog(context);
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(
                      expense['name'],
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
                          expense['description'],
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: lightColorScheme.surface,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                expense['category'],
                                style: TextStyle(
                                  color: lightColorScheme.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${expense['expenseDate'].day}/${expense['expenseDate'].month}/${expense['expenseDate'].year}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          expense['amount'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(height: 8),
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
                                //_showEditExpenseDialog(context, expense);
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                                size: 20,
                              ),
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                //_showDeleteConfirmationDialog(context, expense);
                              },
                            ),
                          ],
                        ),
                      ],
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


}
