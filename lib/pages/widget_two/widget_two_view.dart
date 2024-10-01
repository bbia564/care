import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring/pages/widget_two/two_blood/two_blood_view.dart';
import 'package:monitoring/pages/widget_two/two_breathing/two_breathing_view.dart';
import 'package:monitoring/pages/widget_two/two_heart/two_heart_view.dart';
import 'package:monitoring/pages/widget_two/two_temperature/two_temperature_view.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'widget_two_logic.dart';

class WidgetTwoPage extends StatefulWidget {
  @override
  State<WidgetTwoPage> createState() => _WidgetTwoPageState();
}

class _WidgetTwoPageState extends State<WidgetTwoPage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<WidgetTwoLogic>();

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Container(
        child: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      labelPadding: EdgeInsets.zero,
                      labelStyle: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      indicator: UnderlineTabIndicator(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          borderSide:
                              BorderSide(width: 2.0, color: primaryColor)),
                      tabs: const [
                        SizedBox(
                            width: 120,
                            child: Tab(
                              text: "Temperature",
                              height: 40,
                            )),
                        SizedBox(
                            width: 91,
                            child: Tab(
                              text: "Blood",
                              height: 40,
                            )),
                        SizedBox(
                            width: 91,
                            child: Tab(
                              text: "Heart",
                              height: 40,
                            )),
                        SizedBox(
                            width: 100,
                            child: Tab(
                              text: "Breathing",
                              height: 40,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                TwoTemperaturePage(),
                TwoBloodPage(),
                TwoHeartPage(),
                TwoBreathingPage()
              ],
            ),
          ))
        ].toColumn().marginAll(12),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(12)),
    ).decorated(
        gradient: const LinearGradient(
            colors: [Color(0xffd0ffed), Color(0xfff8f8f8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
