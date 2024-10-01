import 'package:get/get.dart';

import 'one_heart_logic.dart';

class OneHeartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OneHeartLogic());
  }
}
