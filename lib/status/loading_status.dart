import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoadingStatus extends GetxController{
  var isMainLoading = false.obs; // 무작위 음식점 로딩
  var isTagLoading = false.obs; // Tag 음식점 로딩
  var isLikeLoading = false.obs; // 좋아요 페이지 로딩

  updateMainLoading(bool status) {
    isMainLoading.value = status;
    update();
  }

  updateTagLoading(bool status) {
    isTagLoading.value = status;
    update();
  }

  updateLikeLoading(bool status) {
    isLikeLoading.value = status;
    update();
  }
}