import 'package:flutter/material.dart';

//
class AdminPageNotification extends StatelessWidget {
  const AdminPageNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text(
          'Admin Notifications Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
