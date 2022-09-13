import '../models/naver_place_model.dart';

class ListUtil {
  static List shuffleAndIgnoreCategory({required int? size, required List<NaverPlaceModel> placeList, List<String>? ignoreList, String? ignore}) {
    Iterable targetList = [];
    if (ignoreList != null && ignoreList.isNotEmpty) {
      targetList = placeList.where((place) {
        var filterValid = true;
        if (place.category != null && place.category!.isNotEmpty) {
          for (var item in place.category!) {
            for (var ignore in ignoreList) {
              if (item.contains(ignore)) {
                filterValid = false;
              }
            }
          }
        }
        return filterValid;
      });
    } else {
      targetList = placeList;
    }
    return shuffleAndTake(size: size, list: targetList.toList());
  }

  static List shuffleAndTake({required int? size, required List list}) {
    size ??= 5;
    list.shuffle();
    return list.take(size).toList();
  }

  static String getFirstFromList({required List list}) {
    if (list.isNotEmpty) {
      return list[0];
    }
    return "";
  }
}
