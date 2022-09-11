import 'package:get/get.dart';
import 'package:lunch_manu/utils/utils.dart';
import 'package:lunch_manu/api/apis.dart';
import 'package:lunch_manu/models/models.dart';
import 'loading_status.dart';

class RandomPlaceStatus extends GetxController {
  var randomItemList = [].obs;
  final LoadingStatus loadingStatus = Get.put(LoadingStatus());

  /// 태그 변경 시 tag item 다시 받아오기
  updateItem() async {
    randomItemList.value = CommonUtils.shuffleAndTake(size: 5, list: (await NaverPlaceApi().search(query: "음식점"))).cast<NaverPlaceModel>();
    loadingStatus.updateMainLoading(false);
    update();
  }

  @override
  void onInit() async {
    updateItem();
    super.onInit();
  }
}