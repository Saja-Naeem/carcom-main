import 'package:carcom/Models/user.dart';

class Customer extends UseModel {
  String driverLicence = "";
  int point = 0;

  Customer({
     String? id,
    required String email,
    required String fullName,
    required String mobileNumber,
    required String image,
    required String password,
    required int age,
    required String civilId,
    required this.driverLicence,
    required this.point,
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

  Customer.def() : super.def();

  Customer.fromjson(Map json) : super.fronJson(json) {
    driverLicence = json['driverLicence'];
    point = json['point'];
  }
  void rentCar() {}
  void viewHistory() {}
  void cancel() {}
  void offerCar() {}
}
