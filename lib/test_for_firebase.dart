import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(25),
          child: MaterialButton(
            minWidth: double.infinity,
            height: 100,
            color: Colors.amber,
            onPressed: onPressed,
            child: const Text("Click"),
          ),
        ),
      ),
    );
  }

  void onPressed() async {
    var r = CarDealer(
     
      email: "h.shattnawi.2002@gmail.com",
      fullName: "asdasda",
      mobileNumber: "mobileNumber",
      image: 'image',
      password: 'password',
      age: 6,
      civilId: 'civilId',
    );
    var rr = await DataBase.getInstans().getAllReservationFor(r);
    for (var res in rr) {
      print("GG = ${res.pickupDate}");
    }
  }
}
