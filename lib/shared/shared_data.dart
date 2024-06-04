import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:carcom/Models/reservation.dart';
import 'package:carcom/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

UseModel sharedUser = UseModel.empty();
Uuid uuid = const Uuid();

double widthNHeight0(BuildContext context, int number) {
  if (number == 0) {
    return MediaQuery.of(context).size.height;
  } else {
    return MediaQuery.of(context).size.width;
  }
}

List<CarModel> demoCares = [];
List<Reservation> demoReservationes = [];

