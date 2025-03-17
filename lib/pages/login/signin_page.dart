import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:prog_mobile_app_educadin/theme/theme.dart';
import 'package:prog_mobile_app_educadin/widgets/login_scaffold.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      child: Column(
        children: [
          Expanded(flex: 1, child: SizedBox(height: 10)),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 48, 24, 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Acesse sua conta',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entre com o menu';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text('Email'),
                        hintText: 'Insira o seu email',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        focusColor: lightColorScheme.primary
                      ),
                    ),
                    const SizedBox(height: 16),
                    PasswordField(
                      color: Colors.blue,
                      passwordConstraint: r'.*[@$#.*].*',
                      hintText: 'A senha deve ter caracteres especiais',
                      border: PasswordBorder(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: lightColorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: lightColorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2,
                            color: lightColorScheme.error,
                          ),
                        ),
                      ),
                      errorMessage:
                          'must contain special character either . * @ # \$',
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                              activeColor: lightColorScheme.primary,
                            ),

                            const Text(
                              'Lembrar-me',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                        const Text('Esqueceu a senha?',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
