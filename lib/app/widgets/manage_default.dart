import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ManageDefaultScaffold extends StatelessWidget {
  const ManageDefaultScaffold({
    super.key,
    required this.child,
    required this.title,
    this.onLogout,
    this.onNottfication,
    this.onUserPressed,
    this.drawer,
  });

  final Widget? child;
  final String title;
  final VoidCallback? onLogout;
  final VoidCallback? onUserPressed;
  final Widget? drawer;
  final VoidCallback? onNottfication;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: lightColorScheme.primary,
        elevation: 0,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: onUserPressed,
          ),
          IconButton(
            icon: const Icon(Icons.notification_add),
            onPressed: onNottfication,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onLogout,
          ),
        ],
      ),
      // extendBodyBehindAppBar: true,
      // body: Stack(
      //   children: [
      //     SafeArea(
      //       child: Column(
      //         children: [
      //           Expanded(child: child!),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      drawer: drawer,
      body: SafeArea(child: child!),
    );
  }
}
