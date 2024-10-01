import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:monitoring/pages/widget_main/widget_main_logic.dart';

import '../../../db_pool/db_pool.dart';
import '../../../db_pool/monitoring_entity.dart';

class OneTemperatureLogic extends GetxController {

  final dbPool = Get.find<DBPool>();

  WidgetMainLogic widgetMainLogic = Get.find<WidgetMainLogic>();

  var inputString = '';
  var list = <MonitoringEntity>[].obs;

  void getData() async {
    final result = await dbPool.getAllData();
    list.value = result.where((e) => e.isToday && e.type.index == 0).toList();
  }

  void commit(BuildContext context) async {
    if (inputString.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter and operate');
      return;
    }
    await dbPool.dbBase.insert('monitoring', {
      'created_time':
      DateTime.now().toIso8601String(),
      'type': 0,
      'input_number': int.tryParse(inputString) ?? 0
    });
    FocusScope.of(context).requestFocus(FocusNode());
    getData();
    Fluttertoast.showToast(msg: 'Have been recorded');
    inputString = '';
    update(['input0']);

  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
