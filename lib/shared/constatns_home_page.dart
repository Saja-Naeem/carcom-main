import 'package:flutter/material.dart';

class ConstantsDashboardTile extends StatelessWidget {
  final dynamic icon;
  final String tileName;
  final int numberOfItems;

  const ConstantsDashboardTile({
    Key? key,
    required this.icon,
    required this.tileName,
    required this.numberOfItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue[200],
                child: icon,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tileName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                Text(
                  '$numberOfItems items',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
