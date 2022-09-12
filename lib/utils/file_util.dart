import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:lunch_manu/utils/web_storage_util.dart';
import 'package:path_provider/path_provider.dart';
import 'date_util.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FileUtil {
  static final logger = Logger();
  static const version = "v1";
  static const postFix = "_$version.json";
  static const likesPath = "likes$postFix";

  /// 위도/경도에 해당하는 json 파일 저장 (126.926;37.473;음식점.json)
  static void saveFromApiRes(List resList, String query, String latLong) async {
    var data = {
      'expired': DateUtil.getNowMillisecondsByAdd(10),
      'currentLatLong': latLong,
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

  /// file system 에 저장된 api result 조회
  static Future<List> readApiRes(String query, String latLong) async {
    var path = _parseFileNameFromLatLong(query, latLong);
    String? fileString = "";

    if (kIsWeb) {
      fileString = WebStorageUtil.readWebStorage(path);
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

  // if 맵에서 제외 => person.remove('key');
  /// 좋아요 목록 저장
  static void saveLikeData(Map<String, dynamic> data) async {

    var savedLikeMapIterable = await readLikeMapIterable();
    var saveMapData = {};

    if (savedLikeMapIterable.isNotEmpty) {
      var replaceData = {};
      savedLikeMapIterable.forEach((key, value) {
        if (key != data["id"]) {
          replaceData.addAll({key: value});
        }
      });
      saveMapData.addAll(replaceData);
    }

    saveMapData.addAll({data["id"]: data});

    var toSave = {
      "modDate": DateUtil.getNowEpoch(),
      "data": saveMapData
    };

    logger.d("[FILE] saveLikeData -> { toSave : $toSave }");

    // web 확인
    if (kIsWeb) {
      WebStorageUtil.saveJsonFile(toSave, likesPath);
    } else {
      saveJsonFile(toSave, likesPath);
    }
  }

  /// like 목록 조회
  static Future<Map<String, dynamic>> readLikeMapIterable() async {
    String? fileString = "";

    if (kIsWeb) {
      fileString = WebStorageUtil.readWebStorageLikes();
    } else {
      // file 위치에 저장된 데이터가 없을 경우 catch error
      try {
        fileString = (await _readLikeFileAsString());
      } catch(e) {
        fileString = "";
      }
    }

    logger.d("[FILE] readLikeList -> { isNotEmpty : ${fileString != null && fileString.isNotEmpty} }");

    if (fileString != null && fileString.isNotEmpty) {
      Map<String, dynamic> jsonMap = jsonDecode(fileString);
      return jsonMap["data"]??{};
    }

    return {};
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

  /// 좋아요 목록 file system 조회
  static Future<String> _readLikeFileAsString() async {
    final file = await _localFile(likesPath);
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
    // // 126.300 길이가 +5 할 수 없으므로 index 오류 남 해결필요
    // var lastIndexLong = long.indexOf(".");
    // var lastIndexLat = 0;

    long = num.parse(long.substring(0, long.indexOf(".") + 5)).toStringAsFixed(3);
    lat = num.parse(lat.substring(0, lat.indexOf(".") + 5)).toStringAsFixed(3);
    return '$long;$lat;$query$postFix';
  }

  /// 밀리초 기준으로 현재 일자가 지났는지 확인
  static bool _isExpire(int expired) {
    return DateUtil.getNowEpoch() > expired;
  }
}
