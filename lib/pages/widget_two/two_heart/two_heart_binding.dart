import 'package:get/get.dart';

import 'two_heart_logic.dart';

class TwoHeartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TwoHeartLogic());
  }
}
