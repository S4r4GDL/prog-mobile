import 'package:flutter/material.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final List<Map<String, dynamic>> _goals = [
    {
      'id': 1,
      'name': 'Viagem para o exterior',
      'description': 'Economizar para viagem de férias',
      'targetAmount': 'R\$ 10.000,00',
      'currentAmount': 'R\$ 3.500,00',
      'deadline': DateTime.now().add(const Duration(days: 365)),
      'progress': 0.35,
    },
    {
      'id': 2,
      'name': 'Comprar um carro',
      'description': 'Juntar entrada para financiamento',
      'targetAmount': 'R\$ 20.000,00',
      'currentAmount': 'R\$ 8.000,00',
      'deadline': DateTime.now().add(const Duration(days: 730)),
      'progress': 0.4,
    },
    {
      'id': 3,
      'name': 'Fundo de emergência',
      'description': 'Reserva para 6 meses de despesas',
      'targetAmount': 'R\$ 15.000,00',
      'currentAmount': 'R\$ 9.000,00',
      'deadline': DateTime.now().add(const Duration(days: 180)),
      'progress': 0.6,
    },
    {
      'id': 4,
      'name': 'Curso de especialização',
      'description': 'Investimento em educação',
      'targetAmount': 'R\$ 5.000,00',
      'currentAmount': 'R\$ 2.500,00',
      'deadline': DateTime.now().add(const Duration(days: 90)),
      'progress': 0.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
