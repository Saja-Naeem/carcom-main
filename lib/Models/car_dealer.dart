import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarDealer extends UseModel {
  List<CarModel> cars = [];
  CarDealer({
     String? id,
    required String email,
    required String fullName,
    required String mobileNumber,
    required String image,
    required String password,
    required int age,
    required String civilId,
  }) : super(
          id: id,
          email: email,
          fullName: fullName,
          mobileNumber: mobileNumber,
          image: image,
          password: password,
          age: age,
          civilId: civilId,
        );

  CarDealer.fromjson(Map json) : super.fronJson(json) {
    (json['cars'] as DocumentReference).get().then(
      (value) {
        cars.add(CarModel.fromJson(value.data() as Map));
      },
    );
  }
  CarDealer.def() : super.def();
  void addCar() {}
  void deleteCar() {}
  void modifyCar() {}
  void showCarList() {}
}
