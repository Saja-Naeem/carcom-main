import 'dart:developer';

class CarModel {
  String? uid;
  String carId = "";
  int manufactureYear = 0;
  String transmissionType = "";
  String status = "";
  double price = 0;
  String fuelType = "";
  String model = "";
  String type = "";
  String colour = "";
  String image = "";
  String ownerName = "";
  // Company company;
  // List<Insurance> insurances;

  CarModel({
    required this.carId,
    required this.manufactureYear,
    required this.transmissionType,
    required this.status,
    required this.price,
    required this.fuelType,
    required this.model,
    required this.type,
    required this.colour,
    required this.image,
    required this.ownerName,
     this.uid,
    // required this.company,
    // required this.insurances,
  });
  CarModel.def();
  CarModel.fromJson(Map json) {
     uid = json["userID"] ?? "";
    carId = json["carId"] ?? "";
    manufactureYear = json["manufactureYear"] ?? 0;
    transmissionType = json["transmissionType"] ?? "";
    fuelType = json["fuelType"];
    status = json["status"];
    price = json["price"];
    model = json["model"];
    type = json["type"];
    colour = json["colour"];
    image = json["image"];
    ownerName = json["ownerName"];
  }

  
}


