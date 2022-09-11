
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CacheUtil {
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

  static Future<File> writeFileAsString({ String? data, String? path }) async {
    final file = await _localFile(path ?? 'cache/tmp.txt');
    return file.writeAsString(data ?? '');
  }

  static Future<File> _localFile(String morePath) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final path = '${appDocDir.path}/$morePath';
    print("path -> $path");
    return File(path);
  }
}