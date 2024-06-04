// ignore_for_file: non_constant_identifier_names
//
import 'dart:developer';

import 'package:carcom/Models/admin.dart';
import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:carcom/Models/customer.dart';
import 'package:carcom/Models/reservation.dart';
import 'package:carcom/Models/user.dart';
import 'package:carcom/shared/shared_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase {
  //This For create only One object of DataBase
  //$Singlton Design Pattern
  static DataBase? _dataBase;
  static DataBase getInstans() {
    _dataBase ??= DataBase();
    return _dataBase!;
  }

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final String _collectionName = "user";

  final CollectionReference _Users =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference _Cars =
      FirebaseFirestore.instance.collection('cars');
  final CollectionReference _Reservations =
      FirebaseFirestore.instance.collection('reservations');

  Future<bool> createNewUser(UseModel u) async {
    try {
      Map<String, dynamic> json = {};
      if (u is Customer) {
        json = customerToJson(u);
      } else {
        if (u is CarDealer) {
          json = carDealerToJson(u);
        } else {
          json = adminToJson(u as Admin);
        }
      }
      _Users.doc(json["email"]).set(json);
      try {
        // add user to FirebaseAuth
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: u.email, password: u.password);
      } catch (e) {
        if (e is FirebaseAuthException) {
          log("Error occurred: $e");

          String errorMessage = "An error occurred during sign up.";

          if (e.code == 'email-already-in-use') {
            errorMessage = "The account already exists for that email.";
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkIfCustomerExist(UseModel u) async {
    var query = await _Users.get();
    var docs = query.docs;
    for (var element in docs) {
      if ((element.data() as Map<String, dynamic>)["email"] == u.email) {
        return true;
      }
    }
    return false;
  }

  Future<bool> userLogin({required String email, required String pass}) async {
    var query = await _Users.doc(email).get();
    var data = query.data();

    if (data != null) {
      if ((data as Map)["password"] == pass) {
        try {
          UserCredential credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: pass);

          if (!email.isEmpty) {
            sharedUser = (await getUserByEmail(email))!;
          }

          log(credential.user.toString());
          return true;
        } on FirebaseAuthException catch (e) {
          log(e.message.toString());
          return false;
        }
      }
    }

    return false;
  }

  Future<UseModel?> getUserData(String email) async {
    var query = await _Users.doc(email).get();
    var data = query.data();
    if (data != null) {
      String role = (data as Map)["role"];
      switch (role) {
        case "Admin":
          Admin a = Admin(
            id: data["id"],
            email: data["email"],
            fullName: data["fullName"],
            mobileNumber: data["mobileNumber"],
            image: data["image"],
            password: data["password"],
            age: data["age"],
            civilId: data["civilId"],
          );
          return a;
        case "Customer":
          Customer customer = Customer(
            id: data["id"],
            email: data["email"],
            fullName: data["fullName"],
            mobileNumber: data["mobileNumber"],
            image: data["image"],
            password: data["password"],
            age: data["age"],
            civilId: data["civilId"],
            driverLicence: data["driverLicence"],
            point: data["point"],
          );
          return customer;
        case "CarDealer":
          CarDealer carDealer = CarDealer(
            id: data["id"],
            email: data["email"],
            fullName: data["fullName"],
            mobileNumber: data["mobileNumber"],
            image: data["image"],
            password: data["password"],
            age: data["age"],
            civilId: data["civilId"],
          );
          return carDealer;
      }
    }
    return null;
  }

  Map<String, dynamic> customerToJson(Customer cust) {
    return {
      "role": "Customer",
      "id": cust.id,
      "email": cust.email,
      "fullName": cust.fullName,
      "mobileNumber": cust.mobileNumber,
      "image": cust.image,
      "password": cust.password,
      "age": cust.age,
      "civilId": cust.civilId,
      "driverLicence": cust.driverLicence,
      "point": cust.point,
    };
  }

  Map<String, dynamic> carDealerToJson(CarDealer cust) {
    return {
      "role": "CarDealer",
      "id": cust.id,
      "email": cust.email,
      "fullName": cust.fullName,
      "mobileNumber": cust.mobileNumber,
      "image": cust.image,
      "password": cust.password,
      "age": cust.age,
      "civilId": cust.civilId,
    };
  }

  Map<String, dynamic> adminToJson(Admin cust) {
    return {
      "role": "Admin",
      "id": cust.id,
      "email": cust.email,
      "fullName": cust.fullName,
      "mobileNumber": cust.mobileNumber,
      "image": cust.image,
      "password": cust.password,
      "age": cust.age,
      "civilId": cust.civilId,
    };
  }

  void addNewCar(CarModel car) {
    _Cars.doc(car.carId).set({
      "userID": car.uid,
      "carId": car.carId,
      "colour": car.colour,
      // "company": car.company,
      "fuelType": car.fuelType,
      "image": car.image,
      // "insurances": car.insurances,
      "manufactureYear": car.manufactureYear,
      "model": car.model,
      "ownerName": car.ownerName,
      "price": car.price,
      "status": car.status,
      "transmissionType": car.transmissionType,
      "type": car.type,
    });
  }

  Future<List<CarModel>> getAllCars() async {
    List<CarModel> cars = [];
    try {
      var q = await _Cars.get();
      var docs = q.docs;
      for (var doc in docs) {
        Map data = doc.data() as Map;
        CarModel c = CarModel(
          uid: data["userID"],
          carId: data["carId"],
          manufactureYear: data["manufactureYear"],
          transmissionType: data["transmissionType"],
          status: data["status"],
          price: data["price"],
          fuelType: data["fuelType"],
          model: data["model"],
          type: data["type"],
          colour: data["colour"],
          image: data["image"],
          ownerName: data["ownerName"],
        );

        cars.add(c);
        demoCares.add(c);
        print("Alaa--------->${cars.length}");
      }
    } catch (e) {
      print("object ---------->: $e");
    }

    return cars;
  }

//List<CarDealer> ✔
//List<Customer> ✔
//List<reservation> ✔
//create Reservation ✔
//List<Car> For the CarDealer ✔
//List<Reservation> For the CarDealer ✔

  Future<List<CarDealer>> getAllCarDealers() async {
    List<CarDealer> carDealers = [];

    var q = await _Users.get();
    var docs = q.docs;
    var carDs = docs.where(
      (doc) {
        return doc.get("role") == "CarDealer";
      },
    );
    for (var e in carDs) {
      carDealers.add(CarDealer(
        id: e["id"],
        email: e["email"],
        fullName: e["fullName"],
        mobileNumber: e["mobileNumber"],
        image: e["image"],
        password: e["password"],
        age: e["age"],
        civilId: e["civilId"],
      ));
    }
    return carDealers;
  }

  Future<List<Customer>> getAllCustomer() async {
    List<Customer> customer = [];

    var q = await _Users.get();
    var docs = q.docs;
    var carDs = docs.where(
      (doc) {
        return doc.get("role") == "Customer";
      },
    );
    for (var e in carDs) {
      customer.add(Customer(
        id: e["id"],
        email: e["email"],
        fullName: e["fullName"],
        mobileNumber: e["mobileNumber"],
        image: e["image"],
        password: e["password"],
        age: e["age"],
        civilId: e["civilId"],
        driverLicence: e["driverLicence"],
        point: e["point"],
      ));
    }
    return customer;
  }

  void newReservation(Reservation reservation) {
    _Reservations.doc().set(reservationToJson(reservation));
  }

  Map<String, dynamic> reservationToJson(Reservation r) {
    String carPath = "cars/${r.car.carId}";

    String custPath = "user/${r.customer.email}";
    String dealerPath = "user/${r.carDealer.email}";

    return {
      "userID": r.uid,
      "pickupDate": r.pickupDate,
      'returnDate': r.returnDate,
      'state': r.state,
      'pickupLocation': r.pickupLocation,
      'returnLocation': r.returnLocation,
      'reservationId': r.reservationId,
      'reservationDate': r.reservationDate,
      'initialMileage': r.initialMileage,
      'finalMileage': r.finalMileage,
      'contract': r.contract,
      'customer': custPath,
      'carDealer': dealerPath,
      'car': carPath,
    };
  }

 Future<List<Reservation>> getAllReservations() async {
  List<Reservation> res = [];
  var q = await _Reservations.get();
  var docs = q.docs;

  for (var doc in docs) {
    var custRef = doc['customer'] as DocumentReference?;
    var carDRef = doc['ownerName'] as DocumentReference?;
    var carRef = doc['car'] as DocumentReference?;

    if (custRef != null && carDRef != null && carRef != null) {
      var custSnapshot = await custRef.get();
      var carDSnapshot = await carDRef.get();
      var carSnapshot = await carRef.get();

      if (custSnapshot.exists && carDSnapshot.exists && carSnapshot.exists) {
        var custData = custSnapshot.data() as Map?;
        var carDData = carDSnapshot.data() as Map?;
        var carData = carSnapshot.data() as Map?;

        if (custData != null && carDData != null && carData != null) {
          Customer c = Customer.fromjson(custData);
          CarDealer carDealer = CarDealer.fromjson(carDData);
          CarModel theCar = CarModel.fromJson(carData);

          Reservation reservation = Reservation(
            uid: doc["userID"],
            pickupDate: doc["pickupDate"].toDate(),
            returnDate: doc["returnDate"].toDate(),
            state: doc["state"],
            pickupLocation: doc["pickupLocation"],
            returnLocation: doc["returnLocation"],
            reservationId: doc["reservationId"],
            reservationDate: doc["reservationDate"].toDate(),
            initialMileage: double.parse(doc['initialMileage'].toString()),
            finalMileage: double.parse(doc['finalMileage'].toString()),
            contract: doc['contract'],
            customer: c,
            car: theCar,
            carDealer: carDealer,
          );
          demoReservationes.add(reservation);
          res.add(reservation);
          print("Reservation added: ${res.length}");
        }
      }
    }
  }
  print("Total reservations fetched: ${res.length}");
  return res;
}


  Future<List<CarModel>> getCarsFor(CarDealer carDealer) async {
    List<CarModel> cars = [];
    var q = await _Users.doc(carDealer.email).get();

    for (var car in (q.data() as Map)["cars"]) {
      cars.add(CarModel.fromJson((await car.get()).data() as Map));
    }
    return cars;
  }

  Future<List<Reservation>> getAllReservationFor(CarDealer carDealer) async {
    List<Reservation> res = [];
    var q = await _Reservations.get();
    var docs = q.docs;

    for (var doc in docs) {
      var q = await (doc['carDealer'] as DocumentReference).get();
      String cDEmail = (q.data() as Map)["email"];
      if (cDEmail == carDealer.email) {
        res.add(Reservation.fromJson(doc.data() as Map<String, dynamic>));
      }
    }

    return res;
  }

  Future<UseModel?> getUserByEmail(String email) async {
    QuerySnapshot userData = await _fireStore
        .collection(_collectionName)
        .where('email', isEqualTo: email)
        .get();

    if (userData.docs.isEmpty) {
      return null;
    }

    Map<String, dynamic> data = {};

    data["id"] = userData.docs[0].get("id");
    data["fullName"] = userData.docs[0].get("fullName");
    data["email"] = userData.docs[0].get("email");
    data["mobileNumber"] = userData.docs[0].get("mobileNumber");
    data["password"] = userData.docs[0].get("password");
    data["image"] = userData.docs[0].get("image");
    data["age"] = userData.docs[0].get("age");
    data["civilId"] = userData.docs[0].get("civilId");

    return UseModel.fronJson(data);
  }

  Future<UseModel> updateUser(String id) async {
    String? newEmail = sharedUser.email;

    if (newEmail != null) {
      try {
        var currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser?.email != newEmail) {
          await currentUser?.updateEmail(newEmail);
          print("Email updated successfully");
        } else {
          print("Email is already up-to-date");
        }
      } catch (error) {
        print("Error updating email: $error");
      }
    } else {
      print("New email address is null. Cannot update.");
    }

    QuerySnapshot userData = await _fireStore
        .collection(_collectionName)
        .where('id', isEqualTo: id)
        .get();
    String userId = userData.docs[0].id;

    try {
      await FirebaseFirestore.instance.collection('user').doc(userId).update(
        {
          'fullName': sharedUser.fullName,
          'email': sharedUser.email,
          'mobileNumber': sharedUser.mobileNumber,
          'age': sharedUser.age,
        },
      ).whenComplete(() {
        log("user update : ${userId}");
      });
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return await getUserById(id);
  }

  Future<UseModel> getUserById(String Id) async {
    QuerySnapshot userData = await _fireStore
        .collection(_collectionName)
        .where('id', isEqualTo: Id)
        .get();
    Map<String, dynamic> data = {};

    UseModel tempModel;
    data["id"] = userData.docs[0].get("id");
    data["fullName"] = userData.docs[0].get("fullName");
    data["email"] = userData.docs[0].get("email");
    data["mobileNumber"] = userData.docs[0].get("mobileNumber");
    data["password"] = userData.docs[0].get("password");
    data["image"] = userData.docs[0].get("image");
    data["age"] = userData.docs[0].get("age");
    data["civilId"] = userData.docs[0].get("civilId");

    tempModel = UseModel.fronJson(data);

    return tempModel;
  }

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  //  Future<List<CarModel>> getAllRev() async {
  //   List<CarModel> reservations = [];
  //   try {
  //     var q = await _Reservations.get();
  //     var docs = q.docs;
  //     for (var doc in docs) {
  //       Map data = doc.data() as Map;
  //       Reservation c = Reservation(
  //       uid: doc["userID"],
  //         pickupDate: doc["pickupDate"].toDate(),
  //         returnDate: doc["returnDate"].toDate(),
  //         state: doc["state"],
  //         pickupLocation: doc["pickupLocation"],
  //         returnLocation: doc["returnLocation"],
  //         reservationId: doc["reservationId"],
  //         reservationDate: doc["reservationDate"].toDate(),
  //         initialMileage: double.parse(doc['initialMileage'].toString()),
  //         finalMileage: double.parse(doc['finalMileage'].toString()),
  //         contract: doc['contract'],
  //         customer: c,
  //         car: theCar,
  //         carDealer: carDealer,
  //       );

  //       cars.add(c);
  //       demoCares.add(c);
  //       print("Alaa--------->${cars.length}");
  //     }
  //   } catch (e) {
  //     print("object ---------->: $e");
  //   }

  //   return cars;
  // }
}
