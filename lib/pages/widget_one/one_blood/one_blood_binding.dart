import 'package:get/get.dart';

import 'one_blood_logic.dart';

class OneBloodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OneBloodLogic());
  }
}
