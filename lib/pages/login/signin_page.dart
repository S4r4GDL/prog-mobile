import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/widgets/login_scaffold.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(child: Text('Entrar'),);
  }
}
