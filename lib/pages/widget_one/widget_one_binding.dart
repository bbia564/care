import 'package:get/get.dart';

import 'widget_one_logic.dart';

class WidgetOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WidgetOneLogic());
  }
}
