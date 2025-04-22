import 'package:flutter/material.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final List<Map<String, dynamic>> _goals = [
    {
      'id': 1,
      'name': 'Viagem para o exterior',
      'description': 'Economizar para viagem de férias',
      'targetAmount': 'R\$ 10.000,00',
      'currentAmount': 'R\$ 3.500,00',
      'deadline': DateTime.now().add(const Duration(days: 365)),
      'progress': 0.35,
    },
    {
      'id': 2,
      'name': 'Comprar um carro',
      'description': 'Juntar entrada para financiamento',
      'targetAmount': 'R\$ 20.000,00',
      'currentAmount': 'R\$ 8.000,00',
      'deadline': DateTime.now().add(const Duration(days: 730)),
      'progress': 0.4,
    },
    {
      'id': 3,
      'name': 'Fundo de emergência',
      'description': 'Reserva para 6 meses de despesas',
      'targetAmount': 'R\$ 15.000,00',
      'currentAmount': 'R\$ 9.000,00',
      'deadline': DateTime.now().add(const Duration(days: 180)),
      'progress': 0.6,
    },
    {
      'id': 4,
      'name': 'Curso de especialização',
      'description': 'Investimento em educação',
      'targetAmount': 'R\$ 5.000,00',
      'currentAmount': 'R\$ 2.500,00',
      'deadline': DateTime.now().add(const Duration(days: 90)),
      'progress': 0.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: const Text('Minhas Metas', style: TextStyle(color: Colors.white)),
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _goals.length,
              itemBuilder: (context, index) {
                final goal = _goals[index];
                return Card(
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
                                goal['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              children: [
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
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: lightColorScheme.primary,
                                    size: 20,
                                  ),
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    _showEditGoalDialog(context, goal);
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
                                    _showDeleteConfirmationDialog(context, goal);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          goal['description'],
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Meta: ${goal['targetAmount']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Atual: ${goal['currentAmount']}',
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
                                  'Prazo: ${goal['deadline'].day}/${goal['deadline'].month}/${goal['deadline'].year}',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${(goal['progress'] * 100).toInt()}% concluído',
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
                          value: goal['progress'],
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
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          ),
                          child: const Text('Atualizar Progresso'),
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

  void _showAddGoalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildGoalDialog(context, null);
      },
    );
  }

  void _showEditGoalDialog(BuildContext context, Map<String, dynamic> goal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildGoalDialog(context, goal);
      },
    );
  }

  Widget _buildGoalDialog(BuildContext context, Map<String, dynamic>? goal) {
    final isEditing = goal != null;
    final nameController = TextEditingController(text: isEditing ? goal['name'] : '');
    final descriptionController = TextEditingController(text: isEditing ? goal['description'] : '');
    final targetAmountController = TextEditingController(
        text: isEditing ? goal['targetAmount'].toString().replaceAll('R\$ ', '') : '');
    final currentAmountController = TextEditingController(
        text: isEditing ? goal['currentAmount'].toString().replaceAll('R\$ ', '') : '');

    DateTime selectedDate = isEditing ? goal['deadline'] : DateTime.now().add(const Duration(days: 180));

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
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: 'Descrição da meta',
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: targetAmountController,
              decoration: const InputDecoration(
                labelText: 'Valor da Meta (R\$)',
                hintText: '0,00',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: currentAmountController,
              decoration: const InputDecoration(
                labelText: 'Valor Atual (R\$)',
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
                  selectedDate = picked;
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
            // Aqui implementar a lógica para salvar a meta
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

  void _showUpdateProgressDialog(BuildContext context, Map<String, dynamic> goal) {
    final currentAmountController = TextEditingController(
        text: goal['currentAmount'].toString().replaceAll('R\$ ', ''));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atualizar Progresso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Meta: ${goal['name']}'),
              const SizedBox(height: 16),
              TextField(
                controller: currentAmountController,
                decoration: const InputDecoration(
                  labelText: 'Valor Atual (R\$)',
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
                // Aqui implementar a lógica para atualizar o progresso
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

  void _showShareGoalDialog(BuildContext context, Map<String, dynamic> goal) {
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
              Text('Meta: ${goal['name']}'),
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
                // Aqui  implementar a lógica para compartilhar a meta
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

  void _showDeleteConfirmationDialog(BuildContext context, Map<String, dynamic> goal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text('Deseja realmente excluir a meta "${goal['name']}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aqui implementar a lógica para excluir a meta
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
