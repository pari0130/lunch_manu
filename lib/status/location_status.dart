import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lunch_manu/utils/utils.dart';

class LocationStatus extends GetxController {
  var currentLocation = "".obs;

  /// 좌표 값 업데이트
  updateLocation(String? latLong) async {
    final location = latLong ?? await Location().getCurrentLocation();
    currentLocation.value = location;
    update();
  }
}