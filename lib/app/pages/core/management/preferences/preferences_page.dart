import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../widgets/manage_default.dart';
import '../../../../theme/theme.dart';

class NotificationPreferenceDTO {
  final int? id;
  final int? userId;
  final String? type;
  final bool? enabled;

  NotificationPreferenceDTO({this.id, this.userId, this.type, this.enabled});

  factory NotificationPreferenceDTO.fromJson(Map<String, dynamic> json) {
    return NotificationPreferenceDTO(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      type: json['type'] as String?,
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'enabled': enabled,
    };
  }
}

class NotificationPreferenceDTOCreateUpdate {
  final int? userId;
  final String? type;
  final bool? enabled;

  NotificationPreferenceDTOCreateUpdate({this.userId, this.type, this.enabled});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'type': type,
      'enabled': enabled,
    };
  }
}

class SearchFieldValue {
  final String fieldName;
  final dynamic value;
  final String? condition;

  SearchFieldValue({required this.fieldName, required this.value, this.condition});

  Map<String, dynamic> toJson() {
    return {
      'fieldName': fieldName,
      'value': value,
      if (condition != null) 'condition': condition,
    };
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() => 'ApiException: $statusCode - $message';
}

class QueryParam {
  final String name;
  final dynamic value;

  QueryParam(this.name, this.value);
}

Future<String> _decodeBodyBytes(http.Response response) async {
  return utf8.decode(response.bodyBytes.toList());
}

class ApiClient {
  ApiClient();

  Future<dynamic> deserializeAsync(String body, String type) async {
    final decodedJson = json.decode(body);
    if (type == 'List<NotificationPreferenceDTO>') {
      return (decodedJson as List)
          .map((e) => NotificationPreferenceDTO.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (type == 'NotificationPreferenceDTO') {
      return NotificationPreferenceDTO.fromJson(decodedJson as Map<String, dynamic>);
    }
    return decodedJson;
  }

  final Map<String, NotificationPreferenceDTO> _mockDb = {
    '1_NEW_TIPS': NotificationPreferenceDTO(id: 1, userId: 1, type: 'NEW_TIPS', enabled: true),
    '1_BUDGET_ALERTS': NotificationPreferenceDTO(id: 2, userId: 1, type: 'BUDGET_ALERTS', enabled: false),
    '1_GOAL_PROGRESS': NotificationPreferenceDTO(id: 3, userId: 1, type: 'GOAL_PROGRESS', enabled: true),
    '1_PAYMENT_REMINDERS': NotificationPreferenceDTO(id: 4, userId: 1, type: 'PAYMENT_REMINDERS', enabled: true),
    '1_NEW_FEATURES': NotificationPreferenceDTO(id: 5, userId: 1, type: 'NEW_FEATURES', enabled: false),
  };

  Future<http.Response> invokeAPI(String path, String method, List<QueryParam> queryParams, Object? postBody, Map<String, String> headerParams, Map<String, String> formParams, String? contentType) async {
    await Future.delayed(const Duration(milliseconds: 700));

    if (path == '/v1/notification-preferences/search-fields' && method == 'POST') {
      final List<Map<String, dynamic>>? bodyData = postBody is List ? (postBody as List).cast<Map<String, dynamic>>() : null;
      int? searchUserId;
      if (bodyData != null) {
        for (var item in bodyData) {
          if (item['fieldName'] == 'userId' && item['value'] is int) {
            searchUserId = item['value'] as int;
            break;
          }
        }
      }

      if (searchUserId != null) {
        final List<NotificationPreferenceDTO> userPrefs = _mockDb.values
            .where((pref) => pref.userId == searchUserId)
            .toList();
        return http.Response(json.encode(userPrefs.map((e) => e.toJson()).toList()), 200);
      }
      return http.Response('[]', 200); // Sem ID de usuário na busca, retorna vazio
    }
    else if (path == '/v1/notification-preferences' && method == 'POST') {
      // Simula a criação de uma nova preferência
      final NotificationPreferenceDTOCreateUpdate reqData = postBody as NotificationPreferenceDTOCreateUpdate;
      final int newId = (_mockDb.values.map((e) => e.id ?? 0).reduce((a, b) => a > b ? a : b) ) + 1; // ID simples incremental
      final NotificationPreferenceDTO newPref = NotificationPreferenceDTO(
        id: newId,
        userId: reqData.userId,
        type: reqData.type,
        enabled: reqData.enabled,
      );
      _mockDb['${newPref.userId}_${newPref.type}'] = newPref; // Armazena no mock DB
      return http.Response(json.encode(newPref.toJson()), 201); // 201 Created
    }
    else if (path.startsWith('/v1/notification-preferences/') && method == 'PUT') {
      // Simula a atualização de uma preferência existente
      final int? id = int.tryParse(path.split('/').last);
      final NotificationPreferenceDTOCreateUpdate reqData = postBody as NotificationPreferenceDTOCreateUpdate;

      if (id != null) {
        // Encontra e atualiza no mock DB
        final existingEntryKey = _mockDb.entries.firstWhereOrNull((entry) => entry.value.id == id)?.key;
        if (existingEntryKey != null) {
          final updatedPref = NotificationPreferenceDTO(
            id: id,
            userId: reqData.userId ?? _mockDb[existingEntryKey]!.userId, // Mantém o userId se não for fornecido
            type: reqData.type ?? _mockDb[existingEntryKey]!.type, // Mantém o tipo se não for fornecido
            enabled: reqData.enabled,
          );
          _mockDb[existingEntryKey] = updatedPref;
          return http.Response(json.encode(updatedPref.toJson()), 200);
        }
      }
      return http.Response('{"message": "Não Encontrado"}', 404); // Não encontrado para atualização
    }
    return http.Response('{}', 200); // Sucesso padrão para outras chamadas mockadas
  }
}

// Mock da classe NotificationPreferenceControllerApi (como fornecido por você, usando o mock ApiClient)
// Em seu projeto real, esta classe seria auto-gerada.
class NotificationPreferenceControllerApi {
  NotificationPreferenceControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? ApiClient();
  final ApiClient apiClient;

  Future<http.Response> notificationPreferenceControllerCreateWithHttpInfo(NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    final path = r'/v1/notification-preferences';
    Object? postBody = notificationPreferenceDTOCreateUpdate;
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>['application/json'];
    return apiClient.invokeAPI(path, 'POST', queryParams, postBody, headerParams, formParams, contentTypes.isEmpty ? null : contentTypes.first);
  }

  Future<NotificationPreferenceDTO?> notificationPreferenceControllerCreate(NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    final response = await notificationPreferenceControllerCreateWithHttpInfo(notificationPreferenceDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationPreferenceDTO',) as NotificationPreferenceDTO;
    }
    return null;
  }

  Future<List<NotificationPreferenceDTO>?> notificationPreferenceControllerSearchFieldsAction(List<SearchFieldValue> searchFieldValue,) async {
    final response = await notificationPreferenceControllerSearchFieldsActionWithHttpInfo(searchFieldValue,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<NotificationPreferenceDTO>') as List)
          .cast<NotificationPreferenceDTO>()
          .toList(growable: false);
    }
    return null;
  }

  Future<http.Response> notificationPreferenceControllerSearchFieldsActionWithHttpInfo(List<SearchFieldValue> searchFieldValue, { int? page, int? size, List<String>? sort, }) async {
    final path = r'/v1/notification-preferences/search-fields';
    // CORREÇÃO APLICADA AQUI: Converter List<SearchFieldValue> para List<Map<String, dynamic>>
    Object? postBody = searchFieldValue.map((e) => e.toJson()).toList(); // Converter para lista de mapas
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    if (page != null) queryParams.add(QueryParam('page', page));
    if (size != null) queryParams.add(QueryParam('size', size));
    if (sort != null) queryParams.addAll(sort.map((s) => QueryParam('sort', s)));
    const contentTypes = <String>['application/json'];
    return apiClient.invokeAPI(path, 'POST', queryParams, postBody, headerParams, formParams, contentTypes.isEmpty ? null : contentTypes.first);
  }

  Future<NotificationPreferenceDTO?> notificationPreferenceControllerUpdate(int id, NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    final response = await notificationPreferenceControllerUpdateWithHttpInfo(id, notificationPreferenceDTOCreateUpdate,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationPreferenceDTO',) as NotificationPreferenceDTO;
    }
    return null;
  }

  Future<http.Response> notificationPreferenceControllerUpdateWithHttpInfo(int id, NotificationPreferenceDTOCreateUpdate notificationPreferenceDTOCreateUpdate,) async {
    final path = r'/v1/notification-preferences/{id}'.replaceAll('{id}', id.toString());
    Object? postBody = notificationPreferenceDTOCreateUpdate;
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};
    const contentTypes = <String>['application/json'];
    return apiClient.invokeAPI(path, 'PUT', queryParams, postBody, headerParams, formParams, contentTypes.isEmpty ? null : contentTypes.first);
  }
}

extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  late final NotificationPreferenceControllerApi _apiClient;
  final int _currentUserId = 1;

  bool _isLoading = false;
  String? _errorMessage;


  Map<String, int> _notificationPreferenceIds = {}; // Mapeia string de tipo para ID do backend
  bool _notifyNewTips = false; // Padrão para falso, será atualizado pelo backend
  bool _notifyBudgetAlerts = false;
  bool _notifyGoalProgress = false;
  bool _notifyPaymentReminders = false;
  bool _notifyNewFeatures = false;

  // Preferências de privacidade (estado local, não conectado à API atual)
  // ESTES CAMPOS NÃO TÊM SUPORTE NA API DE NOTIFICAÇÕES FORNECIDA.
  // SE PRECISAREM SER SALVOS NO BACKEND, UMA NOVA API (OU EXTENSÃO DA ATUAL) SERÁ NECESSÁRIA.
  bool _shareDataForImprovement = false;
  bool _allowAnonymousStatistics = true;

  // Preferências de exibição (estado local, não conectado à API atual)
  // ESTES CAMPOS NÃO TÊM SUPORTE NA API DE NOTIFICAÇÕES FORNECIDA.
  // SE PRECISAREM SER SALVOS NO BACKEND, UMA NOVA API (OU EXTENSÃO DA ATUAL) SERÁ NECESSÁRIA.
  String _selectedCurrency = 'BRL';
  String _selectedDateFormat = 'DD/MM/AAAA';
  String _selectedTheme = 'Claro';

  @override
  void initState() {
    super.initState();
    // Inicialize o cliente da API. Assuma que defaultApiClient ou uma configuração
    // similar está disponível a partir do seu pacote API gerado.
    _apiClient = NotificationPreferenceControllerApi();
    _loadPreferences(); // Carrega as preferências existentes do backend
  }

  /// Carrega as preferências de notificação do backend.
  /// Pesquisa por userId e atualiza o estado local e os IDs armazenados.
  Future<void> _loadPreferences() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Cria um filtro de pesquisa para o ID do usuário atual
      // SearchFieldValue deve ser fornecido pelo seu pacote API.
      final List<SearchFieldValue> searchCriteria = [
        SearchFieldValue(fieldName: 'userId', value: _currentUserId),
      ];

      // NotificationPreferenceDTO deve ser fornecido pelo seu pacote API.
      final List<NotificationPreferenceDTO>? fetchedPreferences =
      await _apiClient.notificationPreferenceControllerSearchFieldsAction(searchCriteria);

      if (fetchedPreferences != null) {
        _notificationPreferenceIds.clear(); // Limpa os IDs existentes
        // Redefine todos os interruptores de notificação para seus padrões
        _notifyNewTips = false;
        _notifyBudgetAlerts = false;
        _notifyGoalProgress = false;
        _notifyPaymentReminders = false;
        _notifyNewFeatures = false;

        for (var pref in fetchedPreferences) {
          if (pref.type != null && pref.id != null) {
            _notificationPreferenceIds[pref.type!] = pref.id!;
            setState(() {
              switch (pref.type) {
                case 'NEW_TIPS':
                  _notifyNewTips = pref.enabled ?? false;
                  break;
                case 'BUDGET_ALERTS':
                  _notifyBudgetAlerts = pref.enabled ?? false;
                  break;
                case 'GOAL_PROGRESS':
                  _notifyGoalProgress = pref.enabled ?? false;
                  break;
                case 'PAYMENT_REMINDERS':
                  _notifyPaymentReminders = pref.enabled ?? false;
                  break;
                case 'NEW_FEATURES':
                  _notifyNewFeatures = pref.enabled ?? false;
                  break;
              }
            });
          }
        }
      }
    } on ApiException catch (e) { // ApiException deve ser fornecido pelo seu pacote API.
      setState(() {
        _errorMessage = 'Erro ao carregar preferências: ${e.message}';
      });
      _showSnackBar('Erro: ${e.message}', isError: true);
    } catch (e) {
      setState(() {
        _errorMessage = 'Ocorreu um erro inesperado ao carregar: $e';
      });
      _showSnackBar('Erro inesperado: $e', isError: true);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Salva as preferências de notificação atuais no backend.
  /// Cria novas preferências se elas não existirem ou atualiza as existentes.
  Future<void> _savePreferences() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Lista de todos os tipos de notificação e seus estados atuais
    final Map<String, bool> currentNotificationStates = {
      'NEW_TIPS': _notifyNewTips,
      'BUDGET_ALERTS': _notifyBudgetAlerts,
      'GOAL_PROGRESS': _notifyGoalProgress,
      'PAYMENT_REMINDERS': _notifyPaymentReminders,
      'NEW_FEATURES': _notifyNewFeatures,
    };

    List<Future<void>> saveOperations = [];

    for (var entry in currentNotificationStates.entries) {
      final type = entry.key;
      final enabled = entry.value;
      final existingId = _notificationPreferenceIds[type];

      // NotificationPreferenceDTOCreateUpdate deve ser fornecido pelo seu pacote API.
      final NotificationPreferenceDTOCreateUpdate dto = NotificationPreferenceDTOCreateUpdate(
        userId: _currentUserId,
        type: type,
        enabled: enabled,
      );

      if (existingId != null) {
        // Se a preferência já existe, atualize-a
        saveOperations.add(_apiClient.notificationPreferenceControllerUpdate(existingId, dto).then((_) {
          // Nenhuma devolução explícita é necessária, mas garante que a operação seja concluída.
          // O mapa de IDs já está atualizado para IDs existentes.
        }));
      } else {
        // Se a preferência não existe, crie-a
        saveOperations.add(_apiClient.notificationPreferenceControllerCreate(dto).then((createdPref) {
          if (createdPref != null && createdPref.id != null) {
            _notificationPreferenceIds[type] = createdPref.id!; // Armazena o novo ID
          }
        }));
      }
    }

    try {
      await Future.wait(saveOperations);
      _showSnackBar('Preferências de notificação salvas com sucesso!');

      await _loadPreferences();
    } on ApiException catch (e) { // ApiException deve ser fornecido pelo seu pacote API.
      setState(() {
        _errorMessage = 'Erro ao salvar preferências: ${e.message}';
      });
      _showSnackBar('Erro ao salvar: ${e.message}', isError: true);
    } catch (e) {
      setState(() {
        _errorMessage = 'Ocorreu um erro inesperado ao salvar: $e';
      });
      _showSnackBar('Erro inesperado ao salvar: $e', isError: true);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Função auxiliar para mostrar uma mensagem SnackBar.
  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade700 : lightColorScheme.primary,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: 'Minhas Preferências',
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Notificações'),
                _buildNotificationPreferences(),
                const SizedBox(height: 24),
                // _buildSectionTitle('Privacidade'),
                // _buildPrivacyPreferences(),
                // const SizedBox(height: 24),
                // _buildSectionTitle('Exibição'),
                // _buildDisplayPreferences(),
                // const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _savePreferences,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightColorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Text(
                      'Salvar Preferências',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Theme.of(context).colorScheme.error),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
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
                _showNotificationToggleDialog('Dicas financeiras', value); // Chamada do diálogo
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
                _showNotificationToggleDialog('Alertas de orçamento', value); // Chamada do diálogo
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
                _showNotificationToggleDialog('Progresso de metas', value);
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
                _showNotificationToggleDialog('Lembretes de pagamento', value);
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
                _showNotificationToggleDialog('Novas funcionalidades', value); // Chamada do diálogo
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

  // REMOVIDOS: _buildPrivacyPreferences e _buildDisplayPreferences
  // Pois não há suporte de backend para eles na API fornecida.

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

  void _showNotificationToggleDialog(String notificationType, bool isEnabled) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isEnabled ? 'Notificação Ativada' : 'Notificação Desativada'),
          content: Text(
              'Você ${isEnabled ? 'ativou' : 'desativou'} a notificação para "$notificationType". As alterações serão aplicadas ao salvar as preferências.'
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// Widget _buildDropdownTile({
//   required String title,
//   required String value,
//   required List<String> items,
//   required ValueChanged<String?> onChanged,
// }) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 16,
//           ),
//         ),
//         DropdownButton<String>(
//           value: value,
//           items: items
//               .map((item) => DropdownMenuItem<String>(
//             value: item,
//             child: Text(item),
//           ))
//               .toList(),
//           onChanged: onChanged,
//           underline: Container(
//             height: 2,
//             color: lightColorScheme.primary,
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
