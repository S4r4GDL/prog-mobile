import 'package:flutter/material.dart';
import 'package:educadinapi/api.dart';
class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final IncomeControllerApi _api = IncomeControllerApi();
  List<IncomeListDTO> _incomes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadIncomes();
  }

  Future<void> _loadIncomes() async {
    try {
      final result = await _api.incomeControllerListAll();
      setState(() {
        print(result);
        _incomes = result ?? [];
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar rendimentos: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> _addIncome() async {
    final newIncome = IncomeDTOCreateUpdate(
      description: 'Novo dfferf mobile 3',
      amount: 100,
      categoryName: 'ewtg43e4r4t dfthy',
      leadTime: 3,
      incomeDate: DateTime.now(),
      name: 'aetuh',
      userId: 1,
      repeatable: IncomeDTOCreateUpdateRepeatableEnum.MONTHLY
    );
    try {
      await _api.incomeControllerCreate(newIncome);
      _loadIncomes();
    } catch (e) {
      print("Erro ao criar rendimento: $e");
    }
  }

  Future<void> _deleteIncome(int id) async {
    try {
      await _api.incomeControllerRemove(id);
      _loadIncomes();
    } catch (e) {
      print("Erro ao remover rendimento: $e");
    }
  }

  Future<void> _editIncome(int id) async {
    final updatedIncome = IncomeDTOCreateUpdate(
        description: 'sagsedgsdrfrgdrfrg editadoooo mobile 3',
        amount: 100,
        categoryName: 'ewtg43e4r4t dfthy',
        leadTime: 3,
        incomeDate: DateTime.now(),
        name: 'aetuh',
        userId: 1,
        repeatable: IncomeDTOCreateUpdateRepeatableEnum.MONTHLY,
    );
    try {
      await _api.incomeControllerUpdate(id, updatedIncome);
      _loadIncomes();
    } catch (e) {
      print("Erro ao atualizar rendimento: $e");
    }
  }

  Future<void> _viewIncome(int id) async {
    try {
      final income = await _api.incomeControllerGetById(id);
      if (income != null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Detalhes do Rendimento"),
            content: Text(
              'Descrição: ${income.description}\nValor: ${income.amount}\nRepetível: ${income.repeatable}',
            ),
          ),
        );
      }
    } catch (e) {
      print("Erro ao buscar detalhe: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rendimentos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addIncome,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _incomes.length,
        itemBuilder: (context, index) {
          final income = _incomes[index];
          return ListTile(
            title: Text(income.description ?? 'Sem descrição'),
            subtitle: Text('Valor: ${income.amount}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () => _viewIncome(income.id!),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editIncome(income.id!),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteIncome(income.id!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

