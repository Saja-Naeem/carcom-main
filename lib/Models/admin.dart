import 'package:carcom/Models/user.dart';

class Admin extends UseModel {
  Admin({
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

  Admin.fromjson(Map json) : super.fronJson(json);

  void deleteAccount() {}
  void viewCustomers() {}
  void viewCarDealer() {}
  void addCars() {}
  void addCarDealer() {}
  void createAccount() {}
  void viewCarList() {}
  void update() {}
  void viewReservation() {}
}
