import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//
class DateDetermine extends StatelessWidget {
  const DateDetermine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locationTextController = TextEditingController(text: 'Amman');
    final dateFromTextController = TextEditingController(
        text: DateFormat('dd MMM yyyy').format(DateTime.now()));
    final dateToTextController = TextEditingController(
        text: DateFormat('dd MMM yyyy').format(DateTime.now()));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Date Determine',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_city),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CustomTextField(
                    label: 'Where',
                    controller: locationTextController,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CustomTextField(
                    label: 'From',
                    controller: dateFromTextController,
                    validateDate: true,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CustomTextField(
                    label: 'To',
                    controller: dateToTextController,
                    validateDate: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
                  backgroundColor: WidgetStateProperty.all(Colors.grey),
                  elevation: WidgetStateProperty.all(0.0),
                  minimumSize: WidgetStateProperty.all(const Size(200, 50)),
                ),
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool validateDate; // Add a flag to enable/disable date validation
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.validateDate = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (validateDate) {
          // Perform date validation here
          bool isValid = _isValidDate(value);
          if (!isValid) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please enter a valid date format (dd MMM yyyy)'),
              ),
            );
          }
        }
      },
    );
  }

  bool _isValidDate(String date) {
    try {
      // Parse the date
      DateTime parsedDate = DateFormat('dd MMM yyyy').parseStrict(date);

      // Check if parsed date components match the entered date
      List<String> dateParts = date.split(' ');
      int day = int.parse(dateParts[0]);
      String month = dateParts[1];
      int year = int.parse(dateParts[2]);

      // Check if day, month, and year are valid
      if (parsedDate.day != day ||
          parsedDate.year != year ||
          parsedDate.month != DateFormat.MMM().parse(month).month) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
