class CommonUtils {
  static List shuffleAndTake({required int? size, required List list}) {
    size ??= 5;
    list.shuffle();
    return list.take(size).toList();
  }
}
