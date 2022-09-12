import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:logger/logger.dart';

class Location {
  double latitude = 0;
  double longitude = 0;
  final logger = Logger();

  Future<String> getCurrentLocation() async {
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
      // [LOCATION] data -> { latitude : 37.4734848, longitude : 126.926848 }

      latLong = "$longitude;$latitude";
    } catch (e) {
      log(e.toString());
    }
    return latLong;
  }

  static num getDistance(String fromLatLong, String toLatLong) {
    var distance = const Distance();
    var fromLong = fromLatLong.split(";")[0];
    var fromLat = fromLatLong.split(";")[1];
    var toLong = toLatLong.split(";")[0];
    var toLat = toLatLong.split(";")[1];

    final meter = distance(
        LatLng(double.parse(fromLat.toString()),double.parse(fromLong.toString())),
        LatLng(double.parse(toLat.toString()),double.parse(toLong.toString()))
    );

    return meter;
  }
}