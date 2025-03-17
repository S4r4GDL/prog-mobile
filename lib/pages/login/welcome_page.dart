import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/pages/login/signin_page.dart';
import 'package:prog_mobile_app_educadin/pages/login/signup_page.dart';
import 'package:prog_mobile_app_educadin/widgets/login_scaffold.dart';
import 'package:prog_mobile_app_educadin/widgets/rounded_costom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Bem vindo de volta!\n',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\nEntre com seus dados ou cadastre-se',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: RoundedCostomButton(
                      buttonColor: Colors.transparent,
                      buttonText: 'Cadastre-se',
                      labelColor: Colors.white,
                      onTap: SignupPage(),
                    ),
                  ),
                  Expanded(
                    child: RoundedCostomButton(
                      buttonColor: Colors.white,
                      buttonText: 'Entrar',
                      onTap: SigninPage(),
                      labelColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
