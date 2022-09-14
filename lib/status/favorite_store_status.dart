import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lunch_manu/utils/file_util.dart';

class FavoriteStoreStatus extends GetxController {
  var favoriteMapIterable = Future.value(<String, dynamic>{}).obs;
  final logger = Logger();

  /*
  * 선택 시 update status, 여기서 file update,
  * */
  updateItem(Map<String, dynamic> value) async {
    favoriteMapIterable.value = value as Future<Map<String, dynamic>>;
    favoriteMapIterable.value.asStream().forEach((element) {logger.d("test -> $element");});
    update();
  }

  @override
  void onInit() async {
    favoriteMapIterable.value = FileUtil.readFavoriteMapIterable();
    // logger.d("list -> ${favoriteStoreList.value.asStream().forEach((element) {logger.d(element);})}");
    super.onInit();
  }
}