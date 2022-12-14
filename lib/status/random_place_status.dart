import 'package:get/get.dart';
import 'package:lunch_manu/utils/utils.dart';
import 'package:lunch_manu/api/apis.dart';
import 'loading_status.dart';

class RandomPlaceStatus extends GetxController {
  var randomItemList = [].obs;
  final LoadingStatus loadingStatus = Get.put(LoadingStatus());

  /// 태그 변경 시 tag item 다시 받아오기
  updateItem() async {
    randomItemList.value = ListUtil.shuffleAndIgnoreCategory(
        size: 5,
        placeList: (await NaverPlaceApi().search(query: "음식점")),
        ignoreList: ["카페", "술집", "맥주"]
    );
    loadingStatus.updateMainLoading(false);
    update();
  }

  @override
  void onInit() async {
    //updateItem();
    super.onInit();
  }
}