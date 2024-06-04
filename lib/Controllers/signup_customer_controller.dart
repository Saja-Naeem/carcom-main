import 'dart:developer';

import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Models/customer.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//
class SignUpCustomerController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  final NavigationController controller = NavigationController();
  Future<void> saveCredentials(context) async {
    String username = this.username.text;
    String email = this.email.text;
    String password = this.password.text;
    String confirmPassword = this.confirmPassword.text;
    String phoneNumber = this.phoneNumber.text;

    if (confirmPassword == password) {
      Customer c = Customer(
        email: email,
        fullName: username,
        mobileNumber: phoneNumber,
        image: "",
        password: password,
        age: 18,
        civilId: "",
        driverLicence: "",
        point: 0,
      );

      bool isExist = await DataBase.getInstans().checkIfCustomerExist(c);
      if (!isExist) {
        DataBase.getInstans().createNewUser(c);
        //herre should navigate to signin
        // controller.navigateToHomePageCustomer(context);

        controller.navigateToLogin(context);
        
        ///here
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
