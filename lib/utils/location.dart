import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class Location {
  double latitude = 0;
  double longitude = 0;
  final logger = Logger();

  Future<String?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    var latLong = "";
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

      logger.d("[LOCATION] data -> { latitude : $latitude, longitude : $longitude }");

      latLong = "$latitude,$longitude";
    } catch (e) {
      log(e.toString());
    }
    return latLong;
  }
}