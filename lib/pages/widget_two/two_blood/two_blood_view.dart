import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../widget_one/one_temperature/monitoring_item.dart';
import 'two_blood_logic.dart';

class TwoBloodPage extends StatefulWidget {
  @override
  State<TwoBloodPage> createState() => _TwoBloodPageState();
}

class _TwoBloodPageState extends State<TwoBloodPage> {
  final logic = Get.put(TwoBloodLogic());

  @override
  void initState() {
    // TODO: implement initState
    logic.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: <Widget>[
        Container(
          padding: const EdgeInsets.all(15),
          child: <Widget>[
            Expanded(
                child: <Widget>[
                  Obx(() {
                    return Text(
                      logic.normalNum.value.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  }),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'All normal',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ].toColumn()),
            Expanded(
                child: <Widget>[
                  Obx(() {
                    return Text(
                      logic.exceptionNum.value.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  }),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'All out',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ].toColumn())
          ].toRow(),
        ).decorated(
            color: const Color(0xfffcfcfc),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffe0e0e0))),
        Expanded(child: Obx(() {
          return logic.list.value.isEmpty
              ? const Center(
            child: Text('No data for now'),
          )
              : ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount: logic.list.value.length,
              itemBuilder: (_, index) {
                final entity = logic.list.value[index];
                return MonitoringItem(entity);
              });
        }))
      ].toColumn(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}