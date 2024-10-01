import 'package:get/get.dart';

import '../widget_one/widget_one_logic.dart';
import '../widget_three/widget_three_logic.dart';
import '../widget_two/widget_two_logic.dart';
import 'widget_main_logic.dart';

class WidgetMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WidgetMainLogic());
    Get.lazyPut(() => WidgetOneLogic());
    Get.lazyPut(() => WidgetTwoLogic());
    Get.lazyPut(() => WidgetThreeLogic());
  }
}
