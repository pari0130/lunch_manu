import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:lunch_manu/utils/web_storage_util.dart';
import 'package:path_provider/path_provider.dart';
import 'date_util.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FileUtil {
  static final logger = Logger();

  /// 위도/경도에 해당하는 json 파일 저장 (126.926;37.473;음식점.json)
  static void saveFromApiRes(List resList, String query, String latLong) async {
    var data = {
      'expired': DateUtil.getNowMillisecondsByAdd(10),
      'query': query,
      'data': resList
    };
    var path = await _parseFileNameFromLatLong(query, latLong);

    logger.d("[FILE] local file -> { name : $path }");
    logger.d("[FILE] platform -> { isWeb : ${kIsWeb} }");

    // web 확인
    if (kIsWeb) {
      WebStorageUtil.saveJsonFile(data, path);
    } else {
      saveJsonFile(data, path);
    }
  }

  static Future<List> readApiRes(String query, String latLong) async {
    var path = _parseFileNameFromLatLong(query, latLong);
    String? fileString = "";

    if (kIsWeb) {
      fileString = WebStorageUtil.readWebStorage(query, latLong);
    } else {
      // file 위치에 저장된 데이터가 없을 경우 catch error
      try {
        fileString = (await _readFileAsString(path));
      } catch(e) {
        fileString = "";
      }
    }

    logger.d("[FILE] readApiRes -> { isNotEmpty : ${fileString != null && fileString.isNotEmpty} }");

    if (fileString != null && fileString.isNotEmpty) {
      Map<String, dynamic> jsonMap = jsonDecode(fileString);
      var expired = jsonMap["expired"]??0;
      if (!_isExpire(expired)) {
        logger.d("[FILE] readApiRes -> { expired : false }");
        return jsonMap["data"]??[];
      } else {
        logger.d("[FILE] readApiRes -> { expired : true }");
        return [];
      }
    }
    return [];
  }

  /// map 구조 데이터 json 으로 저장 (file system)
  static void saveJsonFile(Object? data, String path) async {
    String jsonString = jsonEncode(data);

    logger.d("[FILE] save data -> $jsonString");

    _writeFileAsString(data: jsonString, path: path);
  }

  /// file system write
  static Future<File> _writeFileAsString(
      {required String data, required String path}) async {
    final file = await _localFile(path);
    return file.writeAsString(data);
  }

  /// file system read
  static Future<String> _readFileAsString(String path) async {
    final file = await _localFile(path);
    return file.readAsString();
  }

  /// local file path read
  static Future<File> _localFile(String morePath) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final path = '${appDocDir.path}/$morePath';

    logger.d("[FILE] local file -> { path : $path }");

    return File(path);
  }

  /// 검색 문자열 및 위경도 기준으로 file name 생성
  static String _parseFileNameFromLatLong(String query, String latLong) {
    var long = latLong.split(";")[0];
    var lat = latLong.split(";")[1];
    long = long.substring(0, long.indexOf(".") + 4);
    lat = lat.substring(0, lat.indexOf(".") + 4);
    return '$long;$lat;$query.json';
  }

  /// 밀리초 기준으로 현재 일자가 지났는지 확인
  static bool _isExpire(int expired) {
    return DateUtil.getNowEpoch() > expired;
  }
}
