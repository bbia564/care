import 'package:get/get.dart';

import 'two_breathing_logic.dart';

class TwoBreathingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TwoBreathingLogic());
  }
}
