import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/app/pages/core/home/dashboard_page.dart';
import 'package:prog_mobile_app_educadin/app/pages/core/management/preferences/preferences_page.dart';
import '../../../widgets/manage_default.dart';
import '../../login/signin_page.dart';
import '../../login/user_session.dart';
import '../management/incomes/incomes_page.dart';
import '../management/goals/goals_page.dart';
import '../management/expenses/expenses_page.dart';
import 'logout_dialog.dart';

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
    LogoutDialog.show(context, () {
      userSession.clear();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SigninPage()),
            (route) => false,
      );
    });
  }

  void _handleUserPressed() {
    print("Usuário");
  }

  void _handleNotificationPressed() {
    print("Notificações");
  }

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: 'Home',
      onLogout: _handleLogout,
      onUserPressed: _handleUserPressed,
      onNottfication: _handleNotificationPressed,
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
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: _handleLogout,
            ),
          ],
        ),
      ),
      child: const DashboardPage(),
    );
  }
}
