import 'package:get/get.dart';

import 'widget_three_logic.dart';

class WidgetThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WidgetThreeLogic());
  }
}
