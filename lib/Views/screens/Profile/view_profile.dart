import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:carcom/Controllers/login_controller.dart';
import 'package:carcom/Models/user.dart';
import 'package:carcom/Views/screens/Profile/edit_profile.dart';
import 'package:carcom/shared/shared_data.dart';
import 'dart:developer';
import 'current_location.dart';
import 'user_location.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final LoginController loginController = Get.put(LoginController());
  String _currentAddress = 'wait';

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
  }

  // Future<void> _getCurrentLocation() async {
  //   try {
  //     CurrentLocation getCurrentLocation = CurrentLocation();
  //     Position? currentLocation = await getCurrentLocation.getCurrentLocation();
  //     log(currentLocation!.latitude.toString());

  //     if (currentLocation != null) {
  //       log('Current location: ${currentLocation.latitude}, ${currentLocation.longitude}');
  //       String city = await UserCity(
  //         longitude: currentLocation.longitude,
  //         latitude: currentLocation.latitude,
  //       );
  //       log('Retrieved city: $city');
  //       if (mounted) {
  //         setState(() {
  //           _currentAddress = city;
  //           log(city);
  //         });
  //       }
  //     } else {
  //       log('Current location is null');
  //     }
  //   } catch (e) {
  //     print('Error getting location: $e');
  //     log('Error in _getCurrentLocation: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    UseModel? user = loginController.user;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfile(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            color: Colors.white,
          ),
        ],
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
                    height: 80,
                    width: 100,
                    margin: const EdgeInsets.only(
                      top: 80,
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
                      image: DecorationImage(
                        image: NetworkImage('${loginController.user?.image}'),
                      ),
                    ),
                  ),
                  Text(
                    user != null ? user.fullName : "User",
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    user != null ? user.email : "email",
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
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 15,
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
                    listProfile(Icons.person, "Full Name", user != null ? user.fullName : "User"),
                    listProfile(Icons.date_range, "Age", user != null ? user.age : 18),
                    //listProfile(Icons.location_pin, "Location", _currentAddress),
                    listProfile(Icons.phone, "Phone Number", user != null ? user.mobileNumber : "0770667293"),
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
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
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
        ],
      ),
    );
  }
}
