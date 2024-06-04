import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:carcom/Models/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  String? uid;
  late DateTime pickupDate;
  late DateTime returnDate;
  late String state;
  late String pickupLocation;
  late String returnLocation;
  late int reservationId;
  late DateTime reservationDate;
  late double initialMileage;
  late double finalMileage;
  late String contract;
  Customer customer = Customer.def();
  late CarDealer carDealer = CarDealer.def();
  late CarModel car = CarModel.def();

  Reservation({
    required this.pickupDate,
    required this.returnDate,
    required this.state,
    required this.pickupLocation,
    required this.returnLocation,
    required this.reservationId,
    required this.reservationDate,
    required this.initialMileage,
    required this.finalMileage,
    required this.contract,
    required this.customer,
    required this.car,
    required this.carDealer,
    this.uid,
  });

  Reservation.fromJson(Map json) {
    pickupDate = json['pickupDate'].toDate();
    returnDate = json['returnDate'].toDate();
    reservationDate = json['reservationDate'].toDate();
    uid = json["userID"];
    state = json["state"];
    pickupLocation = json["pickupLocation"];
    returnLocation = json["returnLocation"];
    contract = json["contract"];

    reservationId = json["reservationId"];
    initialMileage = double.parse(json["initialMileage"].toString());
    finalMileage = double.parse(json["finalMileage"].toString());

    (json['carDealer'] as DocumentReference).get().then(
      (value) {
        carDealer = CarDealer.fromjson(value.data() as Map);
      },
    );
    (json['customer'] as DocumentReference).get().then(
      (value) {
        customer = Customer.fromjson(value.data() as Map);
      },
    );
    (json['car'] as DocumentReference).get().then(
      (value) {
        car = CarModel.fromJson(value.data() as Map);
      },
    );
  }

  void cancelReservation() {}
  void calculateTotalCost() {}
  void checkAvailability() {}
  void getReservationDuration() {}
  void updateReservationDetails() {}
  void sendNotification() {}
  void getReservationDetails() {}
  void addPoint() {}
}
