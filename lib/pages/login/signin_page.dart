import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/pages/login/forget_password_page.dart';
import 'package:prog_mobile_app_educadin/pages/login/signup_page.dart';
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
  bool _obscurePassword = true;

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
          child: SingleChildScrollView(
            child: Form(
              key: _loginFormKey,
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
                        return 'Entre com o email';
                      }
                      String pattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Insira um email válido';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      hintText: 'Insira o seu email',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insira sua senha';
                      } else if (!RegExp(
                        r'.*[@$#%&.*].*',
                      ).hasMatch(value)) {
                        return 'Deve conter caracteres especiais . * @ # \$';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Insira sua senha',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.green,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: lightColorScheme.error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (e) => const ForgetPasswordPage(),
                    ),
                    );
                    }, child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    )
                  ]
              ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {
                    if (rememberMe) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Encaminha para a home page com lembre-se',
                          ),
                        ),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Encaminha para a home page'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Dados inválidos!'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  // Change button background color here
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Optional: Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ), // Optional: Adjust padding
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
                  const SizedBox(height: 32),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Ainda não tem conta? ',
                        ),
                        GestureDetector(
                          onTap: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (e) => const SignupPage(),
                            ),
                          );
                          }, child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        )
                      ]
                  ),
            ],
          ),
        ),
      ),
    ),)
    ,
    ]
    ,
    )
    ,
    );
  }
}
