import 'package:get/get.dart';

import 'widget_two_logic.dart';

class WidgetTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WidgetTwoLogic());
  }
}
