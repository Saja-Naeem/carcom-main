import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:get/get.dart';

class CarDealerController extends GetxController {
  final database = DataBase.getInstans();
  var carDealers = <CarDealer>[].obs;

  @override
  void onInit() {
    fetchCarDealers();
    super.onInit();
  }
//retrive cars from database
  void fetchCarDealers() async {
    try {
      var carDealerList = await database.getAllCarDealers();
      carDealers.assignAll(carDealerList);
    } catch (e) {
      print("Error fetching car dealers: $e");
    }
  }
}
