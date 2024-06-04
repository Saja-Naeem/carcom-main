import 'package:carcom/Controllers/cardealer_listcontroller.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//navigate done

class AdminCarDealersList extends StatefulWidget {
  const AdminCarDealersList({super.key});

  @override
  State<AdminCarDealersList> createState() => _AdminCarDealersListState();
}

class _AdminCarDealersListState extends State<AdminCarDealersList> {
  final CarDealerController _carDealerController =
      Get.put(CarDealerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Car Dealers",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Obx(
        () {
          if (_carDealerController.carDealers.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: _carDealerController.carDealers.length,
              itemBuilder: (context, index) {
                CarDealer carDealer = _carDealerController.carDealers[index];
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
                            right:
                                BorderSide(width: 1.0, color: Colors.white24),
                          ),
                        ),
                        child: const Icon(Icons.person),
                      ),
                      title: Text(
                        carDealer.fullName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.business, color: Colors.white),
                          Text(
                            carDealer.civilId,
                            style: const TextStyle(
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
              },
            );
          }
        },
      ),
    );
  }
}
