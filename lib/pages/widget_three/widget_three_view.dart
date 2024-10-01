import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'widget_three_logic.dart';

class WidgetThreePage extends GetView<WidgetThreeLogic> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(12),
      child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 40,
                    child: <Widget>[
                      const Text(
                        'Clean all data',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.grey,
                      )
                    ].toRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  onTap: () {
                    controller.cleanAllData();
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 40,
                    child: <Widget>[
                      const Text(
                        'About US',
                        style: TextStyle(fontSize: 14),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.grey,
                      )
                    ].toRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  onTap: () {
                    controller.aboutUS(context);
                  },
                )
              ].toColumn(
                  separator: Divider(
                    color: Colors.grey.withOpacity(0.4),
                    height: 15,
                  )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
          )),
    ).decorated(
        gradient: const LinearGradient(
            colors: [Color(0xffd0ffed), Color(0xfff8f8f8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter));
  }
}
