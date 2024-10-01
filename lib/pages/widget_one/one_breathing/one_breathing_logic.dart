import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../db_pool/db_pool.dart';
import '../../../db_pool/monitoring_entity.dart';
import '../../widget_main/widget_main_logic.dart';

class OneBreathingLogic extends GetxController {

  final dbPool = Get.find<DBPool>();

  WidgetMainLogic widgetMainLogic = Get.find<WidgetMainLogic>();

  var inputString = '';
  var list = <MonitoringEntity>[].obs;

  void getData() async {
    final result = await dbPool.getAllData();
    list.value = result.where((e) => e.isToday && e.type.index == 3).toList();
  }

  void commit(BuildContext context) async {
    if (inputString.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter and operate');
      return;
    }
    await dbPool.dbBase.insert('monitoring', {
      'created_time':
      DateTime.now().toIso8601String(),
      'type': 3,
      'input_number': int.tryParse(inputString) ?? 0
    });
    FocusScope.of(context).requestFocus(FocusNode());
    getData();
    Fluttertoast.showToast(msg: 'Have been recorded');
    inputString = '';
    update(['input3']);

  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
