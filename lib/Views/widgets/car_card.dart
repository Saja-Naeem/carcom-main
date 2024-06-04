import 'package:carcom/Models/car.dart';
import 'package:carcom/Models/car_dealer.dart';
import 'package:flutter/material.dart';

class CarCard extends StatefulWidget {
  const CarCard({
    Key? key,
    this.width = 150,
    this.aspectRatio = 5,
    required this.onPress,
    required this.carModel,
  }) : super(key: key);

  final double width, aspectRatio;
  final CarModel carModel;
  final VoidCallback onPress;

  @override
  _CarCardState createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
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
                vertical: 1.0,
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
                        right: BorderSide(
                          width: 1.0,
                          color: Colors.white24,
                        ),
                      ),
                    ),
                    child: const Icon(Icons.person),
                  ),
                  title: Text(
                    widget.carModel.type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.align_vertical_center_sharp,
                        color: Colors.white,
                      ),
                      Text(
                        widget.carModel.model.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
