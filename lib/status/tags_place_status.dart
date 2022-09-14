import 'package:get/get.dart';
import 'package:lunch_manu/utils/utils.dart';
import 'package:lunch_manu/api/apis.dart';
import 'loading_status.dart';

class TagsPlaceStatus extends GetxController {
  var selectedTag = "한식".obs;
  var tagItemList = [].obs;
  final LoadingStatus loadingStatus = Get.put(LoadingStatus());

  /// 선택한 태그 명 변경
  updateTag(String tagName) async {
    selectedTag.value = tagName;
    updateTagItem(selectedTag.value);
    update();
  }

  /// 태그 변경 시 tag item 다시 받아오기
  updateTagItem(String tagName) async {
    tagItemList.value = ListUtil.shuffleAndTake(size: 5, list: (await NaverPlaceApi().search(query: tagName)));
    loadingStatus.updateTagLoading(false);
    update();
  }

  @override
  void onInit() async {
    //updateTagItem(selectedTag.value);
    super.onInit();
  }
}