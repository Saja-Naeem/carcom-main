import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Controllers/signup_car_dealer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//navigation done

class SignupCardealer extends StatefulWidget {
  const SignupCardealer({super.key});

  @override
  State<SignupCardealer> createState() => _SignupCardealerState();
}

class _SignupCardealerState extends State<SignupCardealer> {
  final SignUpCarDealerController dealer = Get.put(SignUpCarDealerController());
  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue.shade900,
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
                    const SizedBox(height: 10.0),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      controller: dealer.username,
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: dealer.username.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: dealer.email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: dealer.email.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: dealer.registrationNo,
                      decoration: InputDecoration(
                        hintText: "Company Registration no.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: dealer.registrationNo.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: dealer.phoneNumber,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.phone),
                        suffixIcon: dealer.password.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: dealer.password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: dealer.password.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: dealer.confirmPassword,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: dealer.confirmPassword.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () {
                        dealer.saveCredentials(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: Colors.blue.shade900,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Sign up as Car Dealer",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        controller.navigateToLogin(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
