import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:universal_html/html.dart';

class WebStorageUtil {
  static final logger = Logger();

  /// 웹 스토리지 저장된 json String 조회
  static String? readWebStorage(String query, String latLong) {
    var path = _parseFileNameFromLatLong(query, latLong);
    return _readFileAsString(path: path);
  }

  /// 웹 스토리지 json 형태 파일 저장
  static void saveJsonFile(Object? data, String path) {
    String jsonString = jsonEncode(data);

    logger.d("[WEB STORAGE] save data -> $jsonString");

    _writeFileAsString(data: jsonString, path: path);
  }

  /// 웹 스토리지에 저장
  static String _writeFileAsString(
      {required String data, required String path}) {
    return window.localStorage[path] = data;
  }

  /// 웹 스토리지에 저장된 데이터 조회
  static String? _readFileAsString({required String path}) {
    return window.localStorage[path];
  }

  /// 검색 문자열 및 위경도 기준으로 file name 생성
  static String _parseFileNameFromLatLong(String query, String latLong) {
    var long = latLong.split(";")[0];
    var lat = latLong.split(";")[1];
    long = long.substring(0, long.indexOf(".") + 4);
    lat = lat.substring(0, lat.indexOf(".") + 4);
    return '$long;$lat;$query.json';
  }
}
