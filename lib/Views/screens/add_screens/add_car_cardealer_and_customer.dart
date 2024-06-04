import 'package:carcom/Controllers/add_cars_controller.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//navigate done
class AddCarCardealer extends StatefulWidget {
  const AddCarCardealer({super.key});

  @override
  State<AddCarCardealer> createState() => _AddCarCardealerState();
}

class _AddCarCardealerState extends State<AddCarCardealer> {
  final AddCarController carController = Get.put(AddCarController());

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final NavigationController navigationController = NavigationController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(9),
          child: Center(
        
           
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                  size: 15,
                ),
              ),
   
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: const Text('Add Car',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
     
              )),
        ),
      ),
      
        
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height - 30,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 15.0),
                 
                    Text(
                      "Enter car details",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      controller: carController.carName,
                      decoration: InputDecoration(
                        hintText: "Car Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.car_repair_rounded),
                        suffixIcon: carController.carName.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: carController.model,
                      decoration: InputDecoration(
                        hintText: "Model",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.mode_of_travel_outlined),
                        suffixIcon: carController.model.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: carController.manufactureYear,
                      decoration: InputDecoration(
                        hintText: "Manufacture Year",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.precision_manufacturing),
                        suffixIcon: carController.manufactureYear.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: carController.transmissionType,
                      decoration: InputDecoration(
                        hintText: "Transmission Type (Automatic or Manual)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.transform_outlined),
                        suffixIcon: carController.transmissionType.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: carController.color,
                      decoration: InputDecoration(
                        hintText: "Color",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.color_lens),
                        suffixIcon: carController.color.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: carController.fuelType,
                      decoration: InputDecoration(
                        hintText: "Fuel Type",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.local_gas_station),
                        suffixIcon: carController.fuelType.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: carController.carImages,
                      decoration: InputDecoration(
                        hintText: "Car Images",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.image),
                        suffixIcon: carController.carImages.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () {
                      carController.saveCarDetails(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: Colors.blue.shade900,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Add Car",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
