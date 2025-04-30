import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Bem-vindo ao App EducaDin!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Descrição do Projeto EducaDin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'O EducaDin é uma aplicação de gestão financeira pessoal que foi desenvolvida para '
                  'atender às necessidades especificas de usuários que enfrentam desafios recorrentes em '
                  'controlar suas finanças e melhorar a sua educação financeira.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Aqui estarão seus gráficos e estatísticas.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(Icons.attach_money, 'Ganhos', 'R\$ 12K'),
                  _buildDashboardCard(Icons.money_off, 'Gastos', 'R\$ 10K'),
                  _buildDashboardCard(Icons.flag, 'Metas', 'R\$ 12K'),
                  _buildDashboardCard(Icons.bar_chart, 'Relatórios', '5 novos'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDashboardCard(IconData icon, String title, String value) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.lightGreen),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        ],
      ),
    ),
  );
}
