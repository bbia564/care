import 'package:get/get.dart';

import 'two_nos_logic.dart';

class TwoNosBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
