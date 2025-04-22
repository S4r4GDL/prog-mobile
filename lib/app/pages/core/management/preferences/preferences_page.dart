import 'package:flutter/material.dart';
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  // Preferências de notificação
  bool _notifyNewTips = true;
  bool _notifyBudgetAlerts = true;
  bool _notifyGoalProgress = true;
  bool _notifyPaymentReminders = true;
  bool _notifyNewFeatures = true;

  // Preferências de privacidade
  bool _shareDataForImprovement = false;
  bool _allowAnonymousStatistics = true;

  // Preferências de exibição
  String _selectedCurrency = 'BRL';
  String _selectedDateFormat = 'DD/MM/AAAA';
  String _selectedTheme = 'Claro';

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: const Text('Preferências', style: TextStyle(color: Colors.white)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Notificações'),
            _buildNotificationPreferences(),
            const SizedBox(height: 24),
            _buildSectionTitle('Privacidade'),
            _buildPrivacyPreferences(),
            const SizedBox(height: 24),
            _buildSectionTitle('Exibição'),
            _buildDisplayPreferences(),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _savePreferences();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightColorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Salvar Preferências',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: lightColorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildNotificationPreferences() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchTile(
              title: 'Dicas financeiras',
              subtitle: 'Receber notificações sobre dicas para melhorar suas finanças',
              value: _notifyNewTips,
              onChanged: (value) {
                setState(() {
                  _notifyNewTips = value;
                });
              },
            ),
            const Divider(),
            _buildSwitchTile(
              title: 'Alertas de orçamento',
              subtitle: 'Receber alertas quando ultrapassar limites de orçamento',
              value: _notifyBudgetAlerts,
              onChanged: (value) {
                setState(() {
                  _notifyBudgetAlerts = value;
                });
              },
            ),
            const Divider(),
            _buildSwitchTile(
              title: 'Progresso de metas',
              subtitle: 'Receber atualizações sobre o progresso de suas metas',
              value: _notifyGoalProgress,
              onChanged: (value) {
                setState(() {
                  _notifyGoalProgress = value;
                });
              },
            ),
            const Divider(),
            _buildSwitchTile(
              title: 'Lembretes de pagamento',
              subtitle: 'Receber lembretes sobre contas e pagamentos próximos',
              value: _notifyPaymentReminders,
              onChanged: (value) {
                setState(() {
                  _notifyPaymentReminders = value;
                });
              },
            ),
            const Divider(),
            _buildSwitchTile(
              title: 'Novas funcionalidades',
              subtitle: 'Receber notificações sobre novas funcionalidades do aplicativo',
              value: _notifyNewFeatures,
              onChanged: (value) {
                setState(() {
                  _notifyNewFeatures = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyPreferences() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchTile(
              title: 'Compartilhar dados para melhorias',
              subtitle: 'Permitir o uso de seus dados para melhorar o aplicativo',
              value: _shareDataForImprovement,
              onChanged: (value) {
                setState(() {
                  _shareDataForImprovement = value;
                });
              },
            ),
            const Divider(),
            _buildSwitchTile(
              title: 'Estatísticas anônimas',
              subtitle: 'Permitir o envio de estatísticas anônimas de uso',
              value: _allowAnonymousStatistics,
              onChanged: (value) {
                setState(() {
                  _allowAnonymousStatistics = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplayPreferences() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDropdownTile(
              title: 'Moeda',
              value: _selectedCurrency,
              items: const ['BRL', 'USD', 'EUR', 'GBP'],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedCurrency = value;
                  });
                }
              },
            ),
            const Divider(),
            _buildDropdownTile(
              title: 'Formato de data',
              value: _selectedDateFormat,
              items: const ['DD/MM/AAAA', 'MM/DD/AAAA', 'AAAA-MM-DD'],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedDateFormat = value;
                  });
                }
              },
            ),
            const Divider(),
            _buildDropdownTile(
              title: 'Tema',
              value: _selectedTheme,
              items: const ['Claro', 'Escuro', 'Sistema'],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedTheme = value;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: lightColorScheme.primary,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildDropdownTile({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          DropdownButton<String>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ))
                .toList(),
            onChanged: onChanged,
            underline: Container(
              height: 2,
              color: lightColorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  void _savePreferences() {
    // Aqui seria implementada a lógica para salvar as preferências
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preferências salvas com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
