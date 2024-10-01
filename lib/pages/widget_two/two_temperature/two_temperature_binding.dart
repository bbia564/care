import 'package:get/get.dart';

import 'two_temperature_logic.dart';

class TwoTemperatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TwoTemperatureLogic());
  }
}
