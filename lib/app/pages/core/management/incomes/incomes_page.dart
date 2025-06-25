import 'package:educadinapi/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';
import '../../../login/user_session.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({super.key});

  @override
  State<IncomesPage> createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  final IncomeControllerApi _api = IncomeControllerApi();
  List<IncomeListDTO> _allIncomes = [];
  List<IncomeListDTO> _filteredIncomes = [];

  bool _isLoading = true;

  final TextEditingController _searchController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_applyFilters);

    _fetchDataAndApplyFilters();
  }

  @override
  void dispose() {
    _searchController.removeListener(_applyFilters);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchDataAndApplyFilters() async {
    final userId = userSession.userId;
    if (userId == null) {
      setState(() => _isLoading = false);
      return;
    }
    setState(() => _isLoading = true);

    try {
      final result = await _api.incomeControllerGetByUserId(userId);
      setState(() {
        _allIncomes = result ?? [];
        _applyFilters();
        _isLoading = false;
      });
    } catch (e) {
      print("Erro ao buscar receitas: $e");
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar receitas: ${e.toString()}')),
        );
      }
    }
  }

  void _applyFilters() {
    List<IncomeListDTO> filteredList = List.from(_allIncomes);
    final String searchQuery = _searchController.text.trim().toLowerCase();

    if (searchQuery.isNotEmpty) {
      filteredList = filteredList.where((income) =>
          income.name.toString().toLowerCase().contains(searchQuery)).toList();
    }

    if (_startDate != null) {
      filteredList = filteredList.where((income) {
        if (income.incomeDate == null) return false;
        final incomeDate = DateTime(income.incomeDate!.year, income.incomeDate!.month, income.incomeDate!.day);
        final filterDate = DateTime(_startDate!.year, _startDate!.month, _startDate!.day);
        return incomeDate.isAtSameMomentAs(filterDate) || incomeDate.isAfter(filterDate);
      }).toList();
    }

    if (_endDate != null) {
      filteredList = filteredList.where((income) {
        if (income.incomeDate == null) return false;
        final incomeDate = DateTime(income.incomeDate!.year, income.incomeDate!.month, income.incomeDate!.day);
        final filterDate = DateTime(_endDate!.year, _endDate!.month, _endDate!.day);
        return incomeDate.isAtSameMomentAs(filterDate) || incomeDate.isBefore(filterDate);
      }).toList();
    }

    setState(() {
      _filteredIncomes = filteredList;
    });
  }

  Future<void> _addIncome(IncomeDTOCreateUpdate newIncome) async {
    try {
      await _api.incomeControllerCreate(newIncome);
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Receita "${newIncome.name}" adicionada com sucesso!')));
      _fetchDataAndApplyFilters();
    } catch (e) {
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao adicionar receita: ${e.toString()}')));
    }
  }

  Future<void> _deleteIncome(int id) async {
    try {
      await _api.incomeControllerRemove(id);
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Receita excluída com sucesso!')));
      _fetchDataAndApplyFilters();
    } catch (e) {
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao excluir receita: ${e.toString()}')));
    }
  }

  Future<void> _editIncome(int id, IncomeDTOCreateUpdate updatedIncome) async {
    try {
      await _api.incomeControllerUpdate(id, updatedIncome);
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Receita "${updatedIncome.name}" atualizada com sucesso!')));
      _fetchDataAndApplyFilters();
    } catch (e) {
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao atualizar receita: ${e.toString()}')));
    }
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            Future<void> pickDate(bool isStartDate) async {
              final now = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context, initialDate: (isStartDate ? _startDate : _endDate) ?? now,
                firstDate: DateTime(2000), lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setModalState(() {
                  if (isStartDate) _startDate = pickedDate; else _endDate = pickedDate;
                });
              }
            }
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
              child: Wrap(
                runSpacing: 16,
                children: [
                  Text('Filtrar por Período', style: Theme.of(context).textTheme.titleLarge),
                  _buildDateSelector(context, label: 'Data Início', date: _startDate, onTap: () => pickDate(true)),
                  _buildDateSelector(context, label: 'Data Fim', date: _endDate, onTap: () => pickDate(false)),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Limpa as datas no menu e na tela principal
                            setModalState(() { _startDate = null; _endDate = null; });
                            setState(() { _startDate = null; _endDate = null; });
                            _applyFilters();
                          },
                          child: const Text('Limpar Datas'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _applyFilters();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: lightColorScheme.primary, foregroundColor: Colors.white),
                          child: const Text('Aplicar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddIncomeDialog(context),
        backgroundColor: lightColorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ManageDefaultScaffold(
        title: 'Meus Ganhos',
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Pesquisar por nome...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(onPressed: _showFilterBottomSheet, icon: const Icon(Icons.tune), tooltip: 'Filtros avançados'),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredIncomes.isEmpty
                  ? Center(child: Text('Nenhuma receita encontrada.', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)))
                  : ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                itemCount: _filteredIncomes.length,
                itemBuilder: (context, index) {
                  final income = _filteredIncomes[index];
                  return Slidable(
                    key: ValueKey(income.id),
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _showEditIncomeDialog(context, income),
                          backgroundColor: lightColorScheme.primary, foregroundColor: Colors.white,
                          icon: Icons.edit, label: 'Editar', borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(onDismissed: () => _deleteIncome(income.id!)),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _showDeleteConfirmationDialog(context, income),
                          backgroundColor: Colors.redAccent, foregroundColor: Colors.white,
                          icon: Icons.delete, label: 'Excluir', borderRadius: BorderRadius.circular(12),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        title: Text(income.name.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(income.category?.name?.toString() ?? 'Sem Categoria', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'R\$ ${income.amount!.toStringAsFixed(2).replaceAll('.', ',')}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: lightColorScheme.primary),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              income.incomeDate != null ? DateFormat('dd/MM/yyyy').format(income.incomeDate!) : '',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context, {required String label, required DateTime? date, required VoidCallback onTap}) {
    return InkWell(onTap: onTap, child: InputDecorator(decoration: InputDecoration(labelText: label, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.grey.shade300)), contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(date != null ? DateFormat('dd/MM/yy').format(date) : 'Selecione', style: TextStyle(color: date != null ? Colors.black87 : Colors.grey.shade600)), const Icon(Icons.calendar_today, size: 18)])));
  }

  void _showAddIncomeDialog(BuildContext context) { showDialog(context: context, builder: (_) => _buildIncomeDialog(context, null)); }

  void _showEditIncomeDialog(BuildContext context, IncomeListDTO income) { final incomeMap = {'id': income.id, 'name': income.name, 'description': income.description, 'amount': income.amount, 'category': income.category?.name ?? '', 'incomeDate': income.incomeDate}; showDialog(context: context, builder: (_) => _buildIncomeDialog(context, incomeMap)); }

  Widget _buildIncomeDialog(BuildContext context, Map<String, dynamic>? income) {
    final isEditing = income != null;
    final nameController = TextEditingController(text: isEditing ? income['name'] : '');
    final descriptionController = TextEditingController(text: isEditing ? income['description'] : '');
    final amountController = TextEditingController(text: isEditing ? income['amount'].toString() : '');
    String selectedCategory = isEditing && (income['category'] as String).isNotEmpty ? income['category'] : 'Trabalho';
    DateTime selectedDate = isEditing ? income['incomeDate'] : DateTime.now();
    return AlertDialog(
      title: Text(isEditing ? 'Editar Renda' : 'Adicionar Renda'),
      content: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nome')),
          const SizedBox(height: 16),
          StatefulBuilder(builder: (BuildContext context, StateSetter setStateDropdown) { return DropdownButtonFormField<String>(value: selectedCategory, decoration: const InputDecoration(labelText: 'Categoria'), items: ['Trabalho', 'Investimentos', 'Imóveis', 'Presentes', 'Outros'].map((category) { return DropdownMenuItem(value: category, child: Text(category)); }).toList(), onChanged: (value) { if (value != null) setStateDropdown(() => selectedCategory = value); }); }),
          const SizedBox(height: 16),
          TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Descrição'), maxLines: 2),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: TextField(controller: amountController, decoration: const InputDecoration(labelText: 'Valor (R\$)'), keyboardType: const TextInputType.numberWithOptions(decimal: true))),
            const SizedBox(width: 16),
            Expanded(child: StatefulBuilder(builder: (BuildContext context, StateSetter setStateDialog) { return InkWell(onTap: () async { final picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2020), lastDate: DateTime(2100)); if (picked != null && picked != selectedDate) setStateDialog(() => selectedDate = picked); }, child: InputDecorator(decoration: const InputDecoration(labelText: 'Data'), child: Text(DateFormat('dd/MM/yyyy').format(selectedDate)))); })),
          ]),
        ]),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () {
            final incomeDTO = IncomeDTOCreateUpdate(name: nameController.text, description: descriptionController.text, amount: double.tryParse(amountController.text.replaceAll(',', '.')) ?? 0, categoryName: selectedCategory, incomeDate: selectedDate, leadTime: 1, userId: userSession.userId!, repeatable: IncomeDTOCreateUpdateRepeatableEnum.DONT_REPEATS);
            if (isEditing) { _editIncome(income!['id'], incomeDTO); } else { _addIncome(incomeDTO); }
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(backgroundColor: lightColorScheme.primary, foregroundColor: Colors.white),
          child: Text(isEditing ? 'Salvar' : 'Adicionar'),
        ),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, IncomeListDTO income) {
    showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Confirmar exclusão'), content: Text('Deseja realmente excluir a receita "${income.name}"?'), actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')), ElevatedButton(onPressed: () { Navigator.of(context).pop(); _deleteIncome(income.id!); }, style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white), child: const Text('Excluir'))]));
  }
}