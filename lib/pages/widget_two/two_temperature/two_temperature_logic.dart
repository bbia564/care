import 'package:get/get.dart';

import '../../../db_pool/db_pool.dart';
import '../../../db_pool/monitoring_entity.dart';

class TwoTemperatureLogic extends GetxController {

  final dbPool = Get.find<DBPool>();

  var list = <MonitoringEntity>[].obs;
  var normalNum = 0.obs;
  var exceptionNum = 0.obs;

  void getData() async {
    final result = await dbPool.getAllData();
    list.value = result.where((e) => e.type.index == 0).toList();
    normalNum.value = list.where((e) => e.isNormal).length;
    exceptionNum.value = list.where((e) => !e.isNormal).length;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
