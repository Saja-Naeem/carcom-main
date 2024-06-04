import 'package:flutter/material.dart';

class CustomerFavoritePage extends StatefulWidget {
  const CustomerFavoritePage({super.key});

  @override
  State<CustomerFavoritePage> createState() => _CustomerFavoritePageState();
}

class _CustomerFavoritePageState extends State<CustomerFavoritePage> {
  // Sample data for favorite cars
  List<Map<String, String>> favoriteCars = [
    {
      'imageUrl':
          'https://www.freepngimg.com/thumb/car/10-2-car-download-png.png',
      'name': 'Car Model 1',
      'details': 'Detail about Car Model 1',
    },
    {
      'imageUrl': 'https://www.freepngimg.com/thumb/car/6-2-car-png-file.png',
      'name': 'Car Model 2',
      'details': 'Detail about Car Model 2',
    },
    // Add more cars as needed
  ];

  void _removeCar(int index) {
    setState(() {
      favoriteCars.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Cars'),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: favoriteCars.length,
        itemBuilder: (context, index) {
          final car = favoriteCars[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              leading: Image.network(
                car['imageUrl']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                car['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(car['details']!),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _removeCar(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
