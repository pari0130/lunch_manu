import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoadingStatus extends GetxController {
  var isMainLoading = true.obs;
  var isTagLoading = true.obs;
  var isFavoriteLoading = true.obs;

  /// 무작위 음식점 로딩
  updateMainLoading(bool status) {
    isMainLoading.value = status;
    update();
  }

  /// Tag 음식점 로딩
  updateTagLoading(bool status) {
    isTagLoading.value = status;
    update();
  }

  /// 좋아요 페이지 로딩
  updateFavoriteLoading(bool status) {
    isFavoriteLoading.value = status;
    update();
  }
}