import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/login_controller.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController();

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center, width: 80, height: 80,
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(80)),
                  // child:
                  //Image.asset("images/6394905.jpg",height: 50,)
                ),
              ),
              Container(
                height: 50,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 40,
              ),
              const Text("Email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: loginController.emailController,
                decoration: InputDecoration(
                    hintText: "Enter Your Email ",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.grey),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey))),
              ),
              Container(
                height: 30,
              ),
              const Text("Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: loginController.passwordController,
                decoration: InputDecoration(
                    hintText: "Enter Your Password ",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.grey),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.topRight,
                height: 30,
                child: const Text("Forgot Password? ",
                    style: TextStyle(fontSize: 14)),
              ),
              Center(
                child: MaterialButton(
                  height: 50,
                  minWidth: 300,
                  color: Colors.blue.shade900,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                  
                    loginController.saveCredentials(context);
                    //here
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () =>
                        controller.navigateToChooseAccount(context),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
