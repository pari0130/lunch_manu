class DateUtil {

  /// 전달된 day 만큼 더한 일자의 epoch return
 static int getNowMillisecondsByAdd(int days) {
    final today = DateTime.now();
    final fiftyDaysFromNow = today.add(Duration(days: days));
    return fiftyDaysFromNow.millisecondsSinceEpoch;
  }

  static int getNowEpoch() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}