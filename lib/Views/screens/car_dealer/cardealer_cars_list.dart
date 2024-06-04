import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Controllers/navigation_controller.dart';
import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:carcom/Views/widgets/car_card.dart';
import 'package:carcom/shared/shared_data.dart';
import 'package:flutter/material.dart';
////hereeee
//navigation done

class CarDealerCarList extends StatefulWidget {
  const CarDealerCarList({Key? key}) : super(key: key);

  @override
  State<CarDealerCarList> createState() => _CarDealerCarListState();
}

class _CarDealerCarListState extends State<CarDealerCarList> {
  final NavigationController _navigationController = NavigationController();
  DataBase dataBase=DataBase();

  @override
  void initState() {
    super.initState();
    _initializeCars();
  }

  Future<void> _initializeCars() async {
    List<CarModel> cars = await DataBase.getInstans().getAllCars();
    setState(() {
      demoCares = cars;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> carWidgets = List.generate(
      demoCares.length,
      (index) {
        print("@@@@@@2${demoCares[index].uid}");
           if (demoCares[index].uid == dataBase.getCurrentUserId()) {
        return Padding(
          padding: const EdgeInsets.all(0),
          child: CarCard(
            carModel: demoCares[index],
            onPress: () {
              // Implement navigation to car details if necessary
            },
          ),
        );
      }
      else return Container();
      },
    );

    return Scaffold(
      appBar: AppBar(
        
        leading: Container(
          padding: const EdgeInsets.all(2),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ),
        title: const Text(
          "My Cars",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        actions: [
          GestureDetector(
            onTap: () {
              _navigationController.navigateToAddCarByCardealerPage(context);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16.0),
              padding: const EdgeInsets.all(1.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Text(
                "+",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Divider(
              height: 1,
              color: Colors.grey[300],
            ),
            if (carWidgets.isNotEmpty) ...carWidgets,
            if (carWidgets.isEmpty)
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: widthNHeight0(context, 1) * 0.1),
                    child: Center(
                      child: Column(
                        children: const [
                          Text(
                            "There are no cars to show",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff6482C4),
                              fontFamily: "Kadwa",
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
