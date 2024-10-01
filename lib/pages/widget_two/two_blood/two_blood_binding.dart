import 'package:get/get.dart';

import 'two_blood_logic.dart';

class TwoBloodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TwoBloodLogic());
  }
}
