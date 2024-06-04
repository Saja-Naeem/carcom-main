import 'package:carcom/shared/shared_data.dart';

class UseModel {
  String? id ;
  String email = "";
  String fullName = "";
  String mobileNumber = "";
  String image = "";
  String password = "";
  int age = 0;
  String civilId = "";
  UseModel.empty();
  UseModel({
     this.id,
    required this.email,
    required this.fullName,
    required this.mobileNumber,
    required this.image,
    required this.password,
    required this.age,
    required this.civilId,

  }){
        id = uuid.v4();
  }
  UseModel.fronJson(Map json) {
    id = json['id'];
    email = json['email'];
    fullName = json["fullName"];
    mobileNumber = json['mobileNumber'];
    image = json['image'];
    password = json['password'];
    age = json['age'];
    civilId = json['civilId'];
  }

  

  UseModel.def();
  void editProfile() {}
  void viewProfile() {}
  void logout() {}
  void login() {}
}
