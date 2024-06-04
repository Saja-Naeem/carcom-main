import 'dart:async';

import 'package:carcom/Views/screens/intro_screenes/startpage.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Startup(),
          ),
        );
      },
    );

    return const Scaffold(
        body: Center(
      child: Image(
          image: AssetImage(
              'assets/Carcom_logo.png'), // Make sure to specify the correct file extension
          alignment: Alignment.bottomCenter),
    ));
  }
}
