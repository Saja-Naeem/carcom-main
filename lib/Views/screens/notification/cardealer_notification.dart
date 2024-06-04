import 'package:flutter/material.dart';

//notification page
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications Page"),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10, // Replace with your notifications count
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Notification ${index + 1}'),
              subtitle:
                  Text('This is the detail of notification ${index + 1}.'),
            ),
          );
        },
      ),
    );
  }
}
