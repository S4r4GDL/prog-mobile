import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ManageDefaultScaffold extends StatelessWidget {
  const ManageDefaultScaffold({super.key, this.child, required Text this.title});
  final Widget? child;

  final Text title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: lightColorScheme.primary,
        elevation: 0,
        title: title,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(child: child!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
