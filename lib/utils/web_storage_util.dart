import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:universal_html/html.dart';

class WebStorageUtil {
  static final logger = Logger();
  static const version = "v1";
  static const postFix = "_$version.json";
  static const likesPath = "likes_$postFix";

  /// 웹 스토리지 저장된 json String 조회
  static String? readWebStorage(String path) {
    return _readFileAsString(path: path);
  }

  /// 웹 스토리지에 저장된 좋아요 목록 조회
  static String? readWebStorageLikes() {
    return _readFileAsString(path: likesPath);
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
}
