import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/login_controller.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/shared/constants_home_page.dart';
import 'package:carcom/shared/shared_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//navigation between its pages done

class HomePageCarDealer extends StatefulWidget {
  const HomePageCarDealer({Key? key}) : super(key: key);

  @override
  State<HomePageCarDealer> createState() => _HomePageCarDealerState();
}

class _HomePageCarDealerState extends State<HomePageCarDealer> {
  final NavigationController _navigationController = NavigationController();
  final LoginController loginController = Get.put(LoginController());
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        _navigationController.navigateToNotificCardealerPage(context);
        break;
      case 2:
        _navigationController.navigateToViewProfile(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
      DataBase dataBase = DataBase();
                    dataBase.getAllCarDealers;
                    dataBase.getAllReservations;

print("object----------> ${demoCares.length}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _navigationController.navigateToLogin(context);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 232, 234, 237),
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: '',
            backgroundColor: Colors.blue[900],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: '',
            backgroundColor: Colors.blue[900],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_sharp),
            backgroundColor: Colors.blue[900],
            label: '',
          ),
        ],
      ),
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${loginController.user?.fullName}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _onItemTapped(1); // Navigate to notifications page
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _navigationController
                                    .navigateToCardealerCarsPage(context);
                              },
                              child:  ConstantsDashboardTile(
                                icon: Icon(Icons.car_crash_outlined),
                                tileName: 'My Cars',
                           

                                ///back
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _navigationController
                                    .navigateToCardealerReservationPage(
                                        context);
                              },
                              child: const ConstantsDashboardTile(
                                icon: Icon(Icons.calendar_month_rounded),
                                tileName: 'Reservations',
                          
                                 
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


