import 'package:carcom/Models/car.dart';

class Company {
  int companyId;
  int registrationNumber;
  List<CarModel>? cars;

  Company({
    required this.companyId,
    required this.registrationNumber,
  });
}
