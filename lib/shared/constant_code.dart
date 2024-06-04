import 'package:flutter/material.dart';

class ConstantsDashboardTile extends StatelessWidget {
  //constant code used in many views page
  const ConstantsDashboardTile({
    Key? key,
    required this.icon,
    required this.tileName,
    required this.numberOfItems,
  }) : super(key: key);

  final IconData icon;
  final String tileName;
  final int numberOfItems;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(tileName),
      subtitle: Text('Number of Items: $numberOfItems'),
    );
  }
}
