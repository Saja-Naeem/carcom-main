import 'package:flutter/material.dart';

//navigation done

class AdminCustomerCarsList extends StatefulWidget {
  const AdminCustomerCarsList({Key? key}) : super(key: key);

  @override
  State<AdminCustomerCarsList> createState() => _AdminCustomerCarsListState();
}

class _AdminCustomerCarsListState extends State<AdminCustomerCarsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer Cars List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:
            10, // Replace with the actual number of cars from the database
        itemBuilder: (context, index) {
          return Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                      right: BorderSide(
                        width: 1.0,
                        color: Colors.white24,
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons
                        .car_rental, // Replace with the appropriate icon for cars
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Car name', // Replace with the actual car name from the database
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    Text(
                      'Reservation date', // Replace with the actual reservation date from the database
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  // Add navigation logic here if needed
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
