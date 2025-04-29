// lib/app/pages/core/home/dashboard_page.dart

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Bem-vindo ao App EducaDin!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Aqui estarão seus gráficos e estatísticas.',
            style: TextStyle(fontSize: 16),
          ),
          // Você pode adicionar widgets de gráficos futuramente aqui
        ],
      ),
    );
  }
}
