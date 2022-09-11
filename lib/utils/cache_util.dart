
import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class CacheUtil {
  final logger = Logger();

  /*
  * 위도 경도에 대한 json 파일 저장
  * 위도 경도에서 특정 수치만큼 (초) 거리가 범위안에 있을 경우는 해당 json 파일 return 아니면 새로 api 호출
  * 37.480 3339 126.930 6995 에서 37.480 126.930 까지 같을 경우는 cache
  * */
  static void saveJsonFile() async {
    var data =  {
      'data': 'null',
      'map': {
        'int': 0,
      }
    };
    String jsonString = jsonEncode(data);
    writeFileAsString(data: jsonString, path: 'test.json');
  }

  // static void saveJsonFile() async {
  //   var data =  {
  //     'data': 'null',
  //     'map': {
  //       'int': 0,
  //     }
  //   };
  //   String jsonString = jsonEncode(data);
  //   writeFileAsString(data: jsonString, path: 'test.json');
  // }

  static Future<File> writeFileAsString({ required String data, required String path }) async {
    final file = await _localFile(path);
    // 파일 읽기 file.readAsString();
    return file.writeAsString(data);
  }

  static Future<File> _localFile(String morePath) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final path = '${appDocDir.path}/$morePath';
    print("path -> $path");
    return File(path);
  }
}