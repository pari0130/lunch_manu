import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/api/urls.dart';
import 'package:lunch_manu/models/naver_place_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lunch_manu/utils/utils.dart';
import 'package:lunch_manu/status/status.dart';

class NaverPlaceApi {
  final logger = Logger();

  Future<List<NaverPlaceModel>> search({required String query}) async {
    final LocationStatus locationStatus = Get.put(LocationStatus());
    final location = locationStatus.currentLocation.value;
    // final location = "126.9304383;37.4806604";
    final queryParameters = "query=$query&searchCoord=$location";
    final url = "${Urls.naverPlace}$queryParameters";
    final response = await http.get(Uri.parse(url));
    var placeList = <NaverPlaceModel>[];

    final cachedData = await FileUtil.readApiRes(query, location);

    if (cachedData.isNotEmpty) {
      placeList = cachedData.map((e) => NaverPlaceModel.fromJson(e)).toList();
    } else {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body["result"] != null &&
            (body["result"] as Map<String, dynamic>)["place"] != null) {
          final place = (body["result"] as Map<String, dynamic>)["place"];
          if (place["list"] != null) {
            final list = place["list"] as List;

            logger.d(
                "[API LOG] place -> { url : $url, size : ${list.length}, data : ${list[0]} }");

            placeList = list.map((e) => NaverPlaceModel.fromJson(e)).toList();
          } else {
            throw Exception('Failed to load list');
          }
        } else {
          throw Exception('Failed to load result');
        }
      } else {
        throw Exception('Failed to load search');
      }

      FileUtil.saveFromApiRes(placeList, query, location);
    }

    return placeList;
  }
}
