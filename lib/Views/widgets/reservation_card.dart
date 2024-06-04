import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:carcom/Models/reservation.dart';
import 'package:carcom/Views/widgets/reservation_card.dart';
import 'package:flutter/material.dart';

class ReservationCard extends StatefulWidget {
  const ReservationCard({
    Key? key,
    this.width = 150,
    this.aspectRatio = 5,
    required this.onPress,
    required this.reservationModel,
  }) : super(key: key);

  final double width, aspectRatio;
  final Reservation reservationModel;
  final VoidCallback onPress;

  @override
  _ReservationCardState createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 6.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(right: 12.0),
                      leading: Container(
                        padding: const EdgeInsets.only(right: 12.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            right:
                                BorderSide(width: 1.0, color: Colors.white24),
                          ),
                        ),
                        child: const Icon(Icons.calendar_month),
                      ),
                      title:  Text(
                   widget.reservationModel.customer.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle:  Row(
                        children: [
                          Icon(Icons.timer, color: Colors.white),
                          Text(
                            widget.reservationModel.reservationDate.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right,
                          color: Colors.white),
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
