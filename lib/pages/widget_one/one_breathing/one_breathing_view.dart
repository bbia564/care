import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import '../one_temperature/monitoring_item.dart';
import '../text_field_widget.dart';
import 'one_breathing_logic.dart';

class OneBreathingPage extends StatefulWidget {
  @override
  State<OneBreathingPage> createState() => _OneBreathingPageState();
}

class _OneBreathingPageState extends State<OneBreathingPage> {
  final logic = Get.put(OneBreathingLogic());

  @override
  void initState() {
    // TODO: implement initState
    logic.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(12),
      child: <Widget>[
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 38, bottom: 18, left: 18, right: 18),
              width: double.infinity,
              height: 217,
              child: <Widget>[
                const Text(
                  'Input breathing value (min)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: GetBuilder<OneBreathingLogic>(id: 'input3',builder: (_) {
                          return TextFieldWidget(
                              value: logic.inputString,
                              maxLength: 5,
                              isInteger: true,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              onChange: (value) {
                                logic.inputString = value;
                              });
                        }),
                      ),
                    ),
                    const Text(
                      'times',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ].toRow(),
                )
                    .decorated(
                    color: const Color(0xfffcfcfc),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xffe0e0e0)))
                    .marginSymmetric(vertical: 15),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: 184,
                    height: 50,
                    child: const Text(
                      'Recognition count',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ).decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  onTap: () {
                    logic.commit(context);
                  },
                )
              ].toColumn(),
            )
                .decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12))
                .marginOnly(top: 30),
            <Widget>[
              Image.asset(
                'assets/breathing.webp',
                width: 62,
                height: 62,
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                <Widget>[
                  const Expanded(
                    child:Text(
                      'Historical breathing values (minutes)',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    child: <Widget>[
                      Text(
                        'All',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.withOpacity(0.7)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey.withOpacity(0.7),
                        size: 20,
                      )
                    ].toRow(mainAxisAlignment: MainAxisAlignment.end),
                    onTap: () {
                      logic.widgetMainLogic.currentIndex.value = 1;
                      logic.widgetMainLogic.pageController.jumpToPage(1);
                    },
                  )
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                Divider(
                  height: 15,
                  color: Colors.grey.withOpacity(0.3),
                ),
                Expanded(child: Obx(() {
                  return logic.list.value.isEmpty
                      ? const Center(
                    child: Text('No data for now'),
                  )
                      : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: logic.list.value.length,
                      itemBuilder: (_, index) {
                        final entity = logic.list.value[index];
                        return MonitoringItem(entity);
                      });
                }))
              ].toColumn(),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12)))
      ].toColumn(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}