import 'package:carcom/Controllers/database.dart';
import 'package:carcom/Views/widgets/reservation_card.dart';
import 'package:carcom/shared/shared_data.dart';
import 'package:flutter/material.dart';

class CarDealerReservationList extends StatefulWidget {
  const CarDealerReservationList({super.key});

  @override
  State<CarDealerReservationList> createState() => _CarDealerReservationListState();
}

class _CarDealerReservationListState extends State<CarDealerReservationList> {
  DataBase dataBase = DataBase();

  @override
  void initState() {
    super.initState();
    _loadReservations();
  }

  Future<void> _loadReservations() async {
    await dataBase.getAllReservations();
    print("Loaded reservations: ${demoReservationes.length}");
    setState(() {}); // Update the UI after fetching reservations
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> carWidgets = List.generate(
      demoReservationes.length,
      (index) {
        return Padding(
          padding: const EdgeInsets.all(0),
          child: ReservationCard(
            reservationModel: demoReservationes[index],
            onPress: () {},
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(9),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ),
        title: const Text(
          "Reservations",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
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
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                    child: Center(
                      child: Column(
                        children: const [
                          Text(
                            "There are no reservations to show",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff6482C4),
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
