import 'package:flutter/material.dart';
import '../../login/signin_page.dart';

class LogoutDialog {
  static Future<void> show(BuildContext context, VoidCallback onConfirm) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.grey[900],
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
              titleLarge: TextStyle(color: Colors.white),
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.black,
            ),
          ),
          child: AlertDialog(
            title: const Text('Sair'),
            content: const Text('Você tem certeza que deseja sair do sistema?'),
            actions: [
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Sair'),
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
