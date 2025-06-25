import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:educadinapi/api.dart';
import '../../../widgets/manage_default.dart';
import '../../login/user_session.dart';


class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<NotificationDTO> _notifications = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    final mockData = [
      NotificationDTO(
        id: 1,
        userId: userSession.userId,
        message: 'Sua despesa "Almoço" foi adicionada com sucesso.',
        type: 'AVISO_SISTEMA',
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      NotificationDTO(
        id: 2,
        userId: userSession.userId,
        message: 'Parabéns! Você alcançou 50% da sua meta "Viagem".',
        type: 'PROMOCAO',
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      NotificationDTO(
        id: 3,
        userId: userSession.userId,
        message: 'Um novo ganho de R\$ 1.500,00 foi registrado.',
        type: 'NOVA_MENSAGEM', // Outro tipo
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationDTO(
        id: 4,
        userId: userSession.userId,
        message: 'Lembrete: A fatura do cartão vence amanhã!',
        type: 'AVISO_SISTEMA',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];

    setState(() {
      _notifications = mockData;
      _notifications.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      _isLoading = false;
    });
  }

  Future<void> _deleteNotification(int notificationId) async {
    setState(() {
      _notifications.removeWhere((notification) => notification.id == notificationId);
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notificação removida da lista!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ManageDefaultScaffold(
      title: 'Notificações',
      child: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _notifications.isEmpty
                ? const Center(
              child: Text(
                'Nenhuma notificação encontrada.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
                : RefreshIndicator(
              onRefresh: _loadNotifications, // Permite "puxar para atualizar"
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  final notification = _notifications[index];
                  return Slidable(
                    key: ValueKey(notification.id),
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => _showDeleteConfirmationDialog(context, notification),
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Excluir',
                        ),
                      ],
                    ),
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: _getIconColorForType(notification.type),
                          child: Icon(
                            _getIconForType(notification.type),
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          notification.message.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            notification.createdAt != null
                                ? DateFormat('dd/MM/yyyy HH:mm', 'pt_BR').format(notification.createdAt!)
                                : 'Data indisponível',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, NotificationDTO notification) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Deseja realmente remover esta notificação da lista?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              _deleteNotification(notification.id!);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  IconData _getIconForType(String? type) {
    switch (type?.toUpperCase()) {
      case 'PROMOCAO': return Icons.campaign;
      case 'AVISO_SISTEMA': return Icons.info_outline;
      case 'NOVA_MENSAGEM': return Icons.message;
      default: return Icons.notifications;
    }
  }

  Color _getIconColorForType(String? type) {
    switch (type?.toUpperCase()) {
      case 'PROMOCAO': return Colors.blue;
      case 'AVISO_SISTEMA': return Colors.orange;
      case 'NOVA_MENSAGEM': return Colors.green;
      default: return Colors.grey;
    }
  }
}