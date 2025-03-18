import 'package:flutter/material.dart';

class LoginScaffold extends StatelessWidget {
  const LoginScaffold({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/loginbg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    'assets/images/educadinlogo.png',
                    height: 100,
                  ),
                ),
                Expanded(child: child!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
