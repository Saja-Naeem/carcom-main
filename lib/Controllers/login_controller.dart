import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Models/admin.dart';
import 'package:carcom/Models/customer.dart';
import 'package:carcom/Models/user.dart';
import 'package:carcom/Views/screens/intro_screenes/login.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final NavigationController controller = NavigationController();

  UseModel? user;

  Future<void> saveCredentials(context) async {
    String email = emailController.text;
    String password = passwordController.text;


 bool login=false;
if(!email.isEmpty&& !password.isEmpty)
   login =await DataBase.getInstans().userLogin(email: email, pass: password);

      

    if (login) {
      user = (await DataBase.getInstans().getUserData(email));




      
      
      if (user == null) {
        return;
      }
      print(user!.fullName);

      if (user is Admin) {
        controller.navigateToAdminHomePage(context);
      } else {
        if (user is Customer) {
          controller.navigateToHomePageCustomer(context);
        } else {
          controller.navigateToHomePageCarDealer(context);
        }
      }
    } else {
      print("Wrong Email Or Password!!");
      CherryToast.warning(
        title: const Text("Email Or Password are wrong"),
      ).show(context);
    }
  }
}
