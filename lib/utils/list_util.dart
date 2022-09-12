class ListUtil {
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
