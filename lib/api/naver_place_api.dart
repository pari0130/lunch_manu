import 'package:logger/logger.dart';
import 'package:lunch_manu/api/urls.dart';
import 'package:lunch_manu/models/naver_place_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lunch_manu/utils/utils.dart';

class NaverPlaceApi {
  final logger = Logger();

  Future<List<NaverPlaceModel>> search({required String query}) async {
    final location = await Location().getCurrentLocation();
    final queryParameters = "query=$query&searchCoord=$location";
    final url = "${Urls.naverPlace}$queryParameters";
    final response = await http.get(Uri.parse(url));
    var placeList = <NaverPlaceModel>[];

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body["result"] != null &&
          (body["result"] as Map<String, dynamic>)["place"] != null) {
        final place = (body["result"] as Map<String, dynamic>)["place"];
        if (place["list"] != null) {
          final list = place["list"] as List;

          logger.d(
              "[API LOG] place -> { url : $url, size : ${list.length}, data : ${list} }");

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

    return placeList;
  }
}
