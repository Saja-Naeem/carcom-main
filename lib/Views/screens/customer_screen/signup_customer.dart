import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Controllers/signup_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupCustomer extends StatefulWidget {
  const SignupCustomer({super.key});

  @override
  State<SignupCustomer> createState() => _SignupCustomerState();
}

class _SignupCustomerState extends State<SignupCustomer> {
  final SignUpCustomerController customer = Get.put(SignUpCustomerController());

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
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 30,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 35.0),
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
                      controller: customer.username,
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: customer.username.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: customer.email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: customer.email.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: customer.phoneNumber,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.phone),
                        suffixIcon: customer.password.text.isEmpty
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
                      controller: customer.password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: customer.password.text.isEmpty
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
                      controller: customer.confirmPassword,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: customer.confirmPassword.text.isEmpty
                            ? const Text(
                                '*Required',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () {
                        customer.saveCredentials(context);
                        ////here
                        ///
                        ///
                        ///
                        ///
                        ///
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: Colors.blue.shade900,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Sign up as Customer",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
                const Center(child: Text("OR")),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.blue.shade900,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Text(
                          "Sign Up with Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
