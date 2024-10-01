import 'package:get/get.dart';

import 'one_temperature_logic.dart';

class OneTemperatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OneTemperatureLogic());
  }
}
