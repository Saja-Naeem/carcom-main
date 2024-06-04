import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:flutter/material.dart';

//navigation done

class ChooseAccount extends StatelessWidget {
  const ChooseAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController();

    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Choose account type',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 80),
          Container(
              padding: const EdgeInsets.only(top: 3, left: 3),
              child: ElevatedButton(
                onPressed: () {
                  controller.navigateToCustomerSignUp(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Sign up as Customer",
                  style: TextStyle(fontSize: 16),
                ),
              )),
          const SizedBox(height: 10),
          const Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.only(top: 3, left: 3),
              child: ElevatedButton(
                onPressed: () {
                  controller.navigateToCarDealerSignUp(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  backgroundColor: Colors.blue.shade900,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Sign up as Car Dealer",
                  style: TextStyle(fontSize: 16),
                ),
              )),
        ],
      ),
    ));
  }
}
