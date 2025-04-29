import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/app/pages/core/management/preferences/preferences_page.dart';

import '../../../widgets/manage_default.dart';
import '../management/incomes/incomes_page.dart';
import '../management/goals/goals_page.dart';
import '../management/expenses/expenses_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void _handleLogout() {
    print("Sair do sistema");
  }

  void _handleUserPressed() {
    print("Usuario");
  }

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: 'Home',
      onLogout: _handleLogout,
      onUserPressed: _handleUserPressed,
      drawer: Drawer(
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Ganhos'),
              onTap: () => _navigateTo(const IncomesPage()),
            ),
            ListTile(
              leading: const Icon(Icons.money_off),
              title: const Text('Despesas'),
              onTap: () => _navigateTo(const ExpensesPage()),
            ),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Metas'),
              onTap: () => _navigateTo(const GoalsPage()),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Preferências'),
              onTap: () => _navigateTo(const PreferencesPage()),
            ),

          ],
        ),
      ),
      child: const Center(
        child: Text('Bem-vindo ao App EducaDin!'),
      ),
    );
  }
}
