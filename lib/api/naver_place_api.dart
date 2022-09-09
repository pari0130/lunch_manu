import 'dart:io';
import 'package:lunch_manu/api/urls.dart';
import 'package:lunch_manu/models/naver_place_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer';

class NaverPlaceApi {
  static Future<List<NaverPlaceModel>> search(
      {required String query, required String searchCoord}) async {

    final queryParameters = {
      'query': query,
      'searchCoord': searchCoord,
    };

    final uri = Uri.https(Urls.naverPlace, "", queryParameters);

    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {

      log(response.body);

      return (jsonDecode(response.body) as List)
          .map((e) => NaverPlaceModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load search');
    }
  }
}
