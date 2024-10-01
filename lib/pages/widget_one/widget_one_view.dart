import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:monitoring/main.dart';
import 'package:monitoring/pages/widget_one/one_blood/one_blood_view.dart';
import 'package:monitoring/pages/widget_one/one_heart/one_heart_view.dart';
import 'package:monitoring/pages/widget_one/one_temperature/one_temperature_view.dart';
import 'package:styled_widget/styled_widget.dart';

import 'one_breathing/one_breathing_view.dart';
import 'widget_one_logic.dart';

class WidgetOnePage extends StatefulWidget {
  @override
  State<WidgetOnePage> createState() => _WidgetOnePageState();
}

class _WidgetOnePageState extends State<WidgetOnePage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<WidgetOneLogic>();

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
                        useMaterial3: true,
                        tabBarTheme: const TabBarTheme(
                            indicatorColor: Colors.transparent)),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      labelPadding: EdgeInsets.zero,
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.5),
                          color: Colors.white),
                      tabs: const [
                        SizedBox(
                            width: 120,
                            height: 37,
                            child: Tab(
                              text: "Temperature",
                            )),
                        SizedBox(
                            width: 91,
                            height: 37,
                            child: Tab(
                              text: "Blood",
                            )),
                        SizedBox(
                            width: 91,
                            height: 37,
                            child: Tab(
                              text: "Heart",
                            )),
                        SizedBox(
                            width: 100,
                            height: 37,
                            child: Tab(
                              text: "Breathing",
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).decorated(borderRadius: BorderRadius.circular(10)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                OneTemperaturePage(),
                OneBloodPage(),
                OneHeartPage(),
                OneBreathingPage()
              ],
            ),
          ))
        ].toColumn().marginAll(12),
      ),
    ).decorated(
        gradient: const LinearGradient(
            colors: [Color(0xffd0ffed), Color(0xfff8f8f8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
