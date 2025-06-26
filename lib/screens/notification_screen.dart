import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  // Données de démonstration
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Promotion spéciale',
      'content': '30% de réduction sur les produits de soin jusqu\'à demain',
      'time': 'Il y a 2 heures',
      'isRead': false,
      'icon': Icons.local_offer
    },
    {
      'title': 'Commande prête',
      'content': 'Votre commande #PH-1234 est prête au retrait',
      'time': 'Hier, 15:30',
      'isRead': true,
      'icon': Icons.shopping_bag
    },
    {
      'title': 'Rappel médicament',
      'content': 'N\'oubliez pas de prendre votre traitement ce soir',
      'time': '12 juin, 09:15',
      'isRead': true,
      'icon': Icons.medical_services
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          IconButton(
            icon: Icon(Icons.checklist),
            onPressed: () => _markAllAsRead(context),
          )
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Icon(notif['icon'], color: Colors.blue),
            ),
            title: Text(
              notif['title'],
              style: TextStyle(
                fontWeight: notif['isRead'] ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notif['content']),
                SizedBox(height: 4),
                Text(
                  notif['time'],
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            trailing: notif['isRead']
                ? null
                : Icon(Icons.circle, color: Colors.blue, size: 12),
            onTap: () => _handleNotificationTap(notif, context),
          );
        },
      ),
    );
  }

  void _markAllAsRead(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Toutes les notifications marquées comme lues'))
    );
    // Implémenter la logique de mise à jour ici
  }

  void _handleNotificationTap(Map<String, dynamic> notification, BuildContext context) {
    // Navigation vers le détail ou action spécifique
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification['title']),
        content: Text(notification['content']),
      ),
    );
  }
}