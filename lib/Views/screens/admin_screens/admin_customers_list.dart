import 'package:flutter/material.dart';

//navigation done

class AdminCustomersList extends StatefulWidget {
  const AdminCustomersList({super.key});

  @override
  State<AdminCustomersList> createState() => _AdminCustomersListState();
}

class _AdminCustomersListState extends State<AdminCustomersList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customers",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 6.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(right: 12.0),
                    leading: Container(
                      padding: const EdgeInsets.only(right: 12.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 1.0, color: Colors.white24),
                        ),
                      ),
                      child: const Icon(Icons.person),
                    ),
                    title: const Text(
                      'Customer Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Row(
                      children: [
                        Icon(Icons.person, color: Colors.white),
                        Text(
                          'Customer\'s gender',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right,
                        color: Colors.white),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
