import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/widgets/login_scaffold.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const LoginScaffold(child: Text('Esqueci minha senha'));
  }
}
