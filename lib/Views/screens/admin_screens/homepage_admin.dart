import 'package:carcom/Controllers/login_controller.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/shared/constant_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//navigation between its pages done

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  final NavigationController controller = NavigationController();
  final LoginController loginController = Get.put(LoginController());

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Logout icon
            onPressed: () {
              // Navigate back to the login page
              controller.navigateToLogin(context);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _navigateToPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: ''),
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
                            'HI ${loginController.user?.fullName}',
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
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
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
                            InkWell(
                              onTap: () {
                                controller.navigateToAdminCarListPage(context);
                              },
                              child: const ConstantsDashboardTile(
                                icon: Icons.car_crash_outlined,
                                tileName: 'Customer\'s Cars List',
                                numberOfItems: 10,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.navigateToAdminReservationListPage(
                                    context);
                              },
                              child: const ConstantsDashboardTile(
                                icon: Icons.calendar_month_rounded,
                                tileName: 'Reservations',
                                numberOfItems: 10, //retrive from data base
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .navigateToAdminCustomerListPage(context);
                              },
                              child: const ConstantsDashboardTile(
                                icon: Icons.people,
                                tileName: 'Customers',
                                numberOfItems: 10,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller
                                    .navigateToAdminCardealerListPage(context);
                              },
                              child: const ConstantsDashboardTile(
                                icon: Icons.people_alt_outlined,
                                tileName: 'Car Dealers',
                                numberOfItems: 10,
                              ),
                            ),
                          ],
                        ),
                      )
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

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        // Navigate to home
        break;
      case 1:
        controller.navigateToAdminNotifyPage(context);
        break;
      case 2:
        controller.navigateToUserProfilePage(context);
        break;
    }
  }
}
