import 'package:get/get.dart';

import 'one_breathing_logic.dart';

class OneBreathingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OneBreathingLogic());
  }
}
