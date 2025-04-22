import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/app/pages/core/management/income/%5Bid%5D_income_page.dart';

import '../../../widgets/manage_default.dart';
import '../../../widgets/rounded_costom_button.dart';
import '../management/incomes/incomes_page.dart';

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
      RoundedCostomButton(
        buttonColor: Colors.grey,
        buttonText: 'Ganhos',
        labelColor: Colors.white,
        onTap: IncomesPage(),
      ),

    ]));
  }
}
