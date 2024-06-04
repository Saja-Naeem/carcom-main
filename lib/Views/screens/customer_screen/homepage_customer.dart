import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/login_controller.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/reservation.dart';
import 'package:carcom/Views/screens/reservation_screens/choose_date_of_reservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//navigation between its pages done

class HomepageCustomer extends StatefulWidget {
  const HomepageCustomer({super.key});

  @override
  State<HomepageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomepageCustomer> {
  final LoginController loginController = Get.put(LoginController());
  final NavigationController _navigationController = NavigationController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigationController.navigateByIndex(context, index);
  }

  List brands = [
    {
      "iconname": Icons.car_rental,
      "title": "BMW",
    },
    {
      "iconname": Icons.car_rental,
      "title": "Toyota",
    },
    {
      "iconname": Icons.car_rental,
      "title": "Mercedes",
    },
    {
      "iconname": Icons.car_rental,
      "title": "Tesla",
    },
    {
      "iconname": Icons.car_rental,
      "title": "DOG",
    },
    {
      "iconname": Icons.car_rental,
      "title": "AUDI",
    },
  ];

  List popularCar = [
    {
      //"image": Icons.car_rental,
      "title": "CarName",
      "subtitle": "description",
      "price": "350\$ "
    },
    {
      //"image": Icons.car_rental,
      "title": "CarName",
      "subtitle": "description",
      "price": "350\$ "
    },
    {
      //"image": Icons.car_rental,
      "title": "CarName",
      "subtitle": "description ",
      "price": "350\$ "
    },
    {
      //"image": Icons.car_rental,
      "title": "CarName",
      "subtitle": "description ",
      "price": "350\$ "
    },
  ];
  List<CarModel> allCars = [];
    List<Reservation> allReserv = [];
  bool firstTime = true;
  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      allCars.clear();
      DataBase.getInstans().getAllCars().then((val) {
        setState(() {
          allCars = val;
        });
      });
       DataBase.getInstans().getAllReservations().then((val2) {
        setState(() {
          allReserv = val2;
        });
      });
      firstTime = false;
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          /* leading: IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),*/
          backgroundColor: Colors.blue.shade900,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          selectedItemColor: const Color.fromARGB(255, 232, 234, 237),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                backgroundColor: Colors.blue[900],
                label: "*"),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_outlined),
                backgroundColor: Colors.blue[900],
                label: "*"),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outlined),
                backgroundColor: Colors.blue[900],
                label: "*"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                    height: (MediaQuery.of(context).size).height * 0.2,
                    child: Stack(children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(
                            left: 20.4,
                            right: 20.4,
                            bottom: 36 + 20.4,
                          ),
                          height:
                              (MediaQuery.of(context).size).height * 0.2 - 27,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(34),
                              bottomRight: Radius.circular(36),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'HI ${loginController.user?.fullName}!',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              )
                            ],
                          )),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20.4,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.4,
                          ),
                          height: 54,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 50,
                                  color: Colors.blue.withOpacity(0.2),
                                )
                              ]),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Search",
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    icon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])),
                Container(
                  height: 30,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 20.0 / 4),
                    child: Row(children: [
                      Text(
                        "Brands",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ])),
                Container(
                  height: 20,
                ),
                SizedBox(
                    height: 100,
                    child: ListView.builder(
                        itemCount: brands.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: const EdgeInsets.all(15),
                                  child: Icon(brands[i]["iconname"], size: 40),
                                ),
                                Text(
                                  brands[i]["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        }))
              ],
            ),
            Container(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20.0 / 4),
                child: Row(children: [
                  Text(
                    "Popular Cars",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ])),
            GridView.builder(
                itemCount: allCars.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 230),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DateDetermine(),
                      ));
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(allCars[i].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(allCars[i].ownerName,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Text(
                              allCars.elementAt(i).model,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.blue[900]),
                            ),
                            const SizedBox(height: 6),
                            Text(allCars[i].price.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
