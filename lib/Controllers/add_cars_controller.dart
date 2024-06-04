import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Models/car.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCarController extends GetxController {
  TextEditingController carName = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController manufactureYear = TextEditingController();
  TextEditingController transmissionType = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController fuelType = TextEditingController();
  TextEditingController carImages = TextEditingController();
  DataBase dataBase=DataBase();

  final NavigationController navigationController = NavigationController();
//save car into database
  Future<void> saveCarDetails(BuildContext context) async {
    String carName = this.carName.text;
    String model = this.model.text;
    String manufactureYear = this.manufactureYear.text;
    String transmissionType = this.transmissionType.text;
    String color = this.color.text;
    String fuelType = this.fuelType.text;
    String carImages = this.carImages.text;

    if (carName.isNotEmpty &&
        model.isNotEmpty &&
        manufactureYear.isNotEmpty &&
        transmissionType.isNotEmpty &&
        color.isNotEmpty &&
        fuelType.isNotEmpty &&
        carImages.isNotEmpty) {
      CarModel car = CarModel(
        uid: dataBase.getCurrentUserId(),
        carId: carName, // Assuming carId is the carName for this example
        colour: color,
        fuelType: fuelType,
        image: carImages,
        manufactureYear: int.parse(manufactureYear),
        model: model,
        ownerName: "", // Owner name can be set if available
        price: 0.0, // Price can be set if available
        status: "available", // Default status
        transmissionType: transmissionType,
        type: "sedan", // Default type, can be modified as needed
      );

      DataBase.getInstans().addNewCar(car);
      navigationController.navigateToHomePageCarDealer(context);
    } else {
      print("All fields are required!");
      // Display a warning toast
      CherryToast.warning(
        title: const Text("All fields are required"),
        description: const Text("Please fill in all fields"),
      ).show(context);
    }
  }
}


