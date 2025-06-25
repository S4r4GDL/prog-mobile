import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ManageDefaultScaffold extends StatelessWidget {
  const ManageDefaultScaffold({
    super.key,
    required this.child,
    required this.title,
    this.onLogout,
    this.drawer,
  });

  final Widget? child;
  final String title;
  final VoidCallback? onLogout;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: lightColorScheme.primary,
        elevation: 0,
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight:  FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onLogout,
          ),
        ],
      ),
      drawer: drawer,
      body: SafeArea(child: child!),
    );
  }
}
