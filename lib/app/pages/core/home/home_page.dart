import 'package:flutter/material.dart';

import '../../../widgets/manage_default.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(title: Text('Home'),child: Column(
    children: [
      Text(context.toString())

    ]));
  }
}
