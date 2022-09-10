import 'dart:developer';

import 'package:logger/logger.dart';
import 'package:lunch_manu/api/urls.dart';
import 'package:lunch_manu/models/naver_place_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NaverPlaceApi {
  final logger = Logger();

  Future<List<NaverPlaceModel>> search(
      {required String query, required String searchCoord}) async {
    final queryParameters = "query=$query&searchCoord=$searchCoord";
    final uri = Uri.parse("${Urls.naverPlace}$queryParameters");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body["result"] != null &&
          (body["result"] as Map<String, dynamic>)["place"] != null) {
        final place = (body["result"] as Map<String, dynamic>)["place"];
        if (place["list"] != null) {
          final list = place["list"] as List;

          logger.d(
              "[API LOG] place -> { size : ${list.length}, data : ${list[0]} }");

          return list.map((e) => NaverPlaceModel.fromJson(e)).toList();
        } else {
          throw Exception('Failed to load list');
        }
      } else {
        throw Exception('Failed to load result');
      }
    } else {
      throw Exception('Failed to load search');
    }
  }
}
