import 'package:flutter/material.dart';

import '../../widgets/login_scaffold.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(child: Text('Cadastro'),);
  }
}
