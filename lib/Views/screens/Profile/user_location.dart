import 'package:geocode/geocode.dart';
import 'dart:developer';

Future<String> UserCity({required double latitude, required double longitude}) async {
  String cityName = "NULL";
  try {
    final value = await GeoCode().reverseGeocoding(latitude: latitude, longitude: longitude);
    cityName = value.city ?? "####";
  } catch (e) {
    cityName = "Waiting";
    log('Error in UserCity: ${e.toString()} #########');
  }
  return cityName;
}
