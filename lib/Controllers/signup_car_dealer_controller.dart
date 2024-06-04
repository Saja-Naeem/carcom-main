import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
class SignUpCarDealerController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController registrationNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final NavigationController controller = NavigationController();

  Future<void> saveCredentials(context) async {
    String username = this.username.text;
    String email = this.email.text;
    // ignore: unused_local_variable
    String registrationNo = this.registrationNo.text;
    String password = this.password.text;
    String confirmPassword = this.confirmPassword.text;
    String phoneNumber = this.phoneNumber.text;

    if (confirmPassword == password) {
      CarDealer c = CarDealer(
      
        email: email,
        fullName: username,
        mobileNumber: phoneNumber,
        image: "",
        password: password,
        age: 18,
        civilId: "",
      );

      bool isExist = await DataBase.getInstans().checkIfCustomerExist(c);
      if (!isExist) {
        DataBase.getInstans().createNewUser(c);
        // controller.navigateToHomePageCarDealer(context);
  controller.navigateToLogin(context);

      } else {
        print("User Alredy Exist!!");
        CherryToast.warning(
          title: const Text("User Alredy Exist"),
          description: const Text("Try to Login"),
        ).show(context);
      }
    } else {
      CherryToast.warning(
        title: const Text("Passwords are not the same"),
      ).show(context);
    }
  }
}
