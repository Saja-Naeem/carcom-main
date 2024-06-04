import 'dart:math';

import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/login_controller.dart';
import 'package:carcom/Models/user.dart';
import 'package:carcom/shared/shared_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//get info from database and display it in feilds
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final LoginController loginController = Get.put(LoginController());
  DataBase dataBase = DataBase();
  UseModel? user;
  @override
  Widget build(BuildContext context) {
    user = loginController.user;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    margin: const EdgeInsets.only(
                      top: 50,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/person.jpg",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    user != null ? user!.fullName : "User",
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    user != null ? user!.email : "email",
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 4,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "PROFILE",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    listProfile(
                      Icons.person,
                      "Full Name",
                      user != null ? user!.fullName : "User",
                    ),
               
                    listProfileNumber(
                        Icons.cake, "Age", user != null ? user!.age : 0),
                  
                    listProfileNumber(
                      Icons.phone,
                      "Phone Number",
                      user != null ? user!.mobileNumber : "0770667293",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, var text2) {
    var nameController = TextEditingController();
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        child: ListTile(
          leading: Icon(
            icon,
            size: 20,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2.toString(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Change your $text1"),
                    content: TextFormField(
                      controller: nameController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              ///this is to change the name of the user
                              if (text1 == "Full Name") {
                                if (nameController.text == "") {
                                  nameController.text =
                                      sharedUser.fullName.toString();
                                } else {
                                  sharedUser.fullName = nameController.text;
                                  print(
                                      ">>>>>>>>>>>2222 ${nameController.text}");
                                  dataBase.updateUser(sharedUser.id.toString());

                                  print("Change name");
                                }
                              }
                              user?.fullName = nameController.text;

                             
                            
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Save")),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.edit)),
        ));
  }

  Widget listProfileNumber(IconData icon, String text1, var text2) {
    var nameController = TextEditingController();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Icon(
          icon,
          size: 20,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                color: Colors.black87,
                fontFamily: "Montserrat",
                fontSize: 14,
              ),
            ),
            Text(
              text2.toString(),
              style: const TextStyle(
                color: Colors.black87,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Change your $text1"),
                content: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        //this is to change the age of the user

                        if (text1 == "Age") {
                          if (nameController.text == "") {
                            nameController.text = sharedUser.age.toString();
                          } else {
                            sharedUser.age = int.parse(nameController.text);

                            dataBase.updateUser(sharedUser.id.toString());
                            user?.age = int.parse(nameController.text); 
                            print("Change age");
                          }
                        }
                      });


                       ///this is to change the phonenumber of the user
                               if (text1 == "Phone Number") {
                                if (nameController.text == "") {
                                  nameController.text =
                                      sharedUser.mobileNumber.toString();
                                } else {
                                  sharedUser.mobileNumber = nameController.text;
                                  print(
                                      ">>>>>>>>>>>2222 ${nameController.text}");
                                  dataBase.updateUser(sharedUser.id.toString());

                                  print("Change name");
                                }
                              }
                              user?.mobileNumber = nameController.text;

                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
