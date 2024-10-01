import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitoring/pages/widget_one/widget_one_view.dart';
import 'package:monitoring/pages/widget_three/widget_three_view.dart';
import 'package:monitoring/pages/widget_two/widget_two_view.dart';

import '../../main.dart';
import 'widget_main_logic.dart';

class WidgetMainPage extends GetView<WidgetMainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          WidgetOnePage(),
          WidgetTwoPage(),
          WidgetThreePage(),
        ],
      ),
      bottomNavigationBar: Obx(()=>_navBars()),
    );
  }

  Widget _navBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon:const Icon(Icons.home,color: Colors.grey,),
          activeIcon: Icon(Icons.home,color: primaryColor,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon:const Icon(Icons.data_exploration_rounded,color: Colors.grey),
          activeIcon: Icon(Icons.data_exploration_rounded,color: primaryColor,),
          label: 'All data',
        ),
        BottomNavigationBarItem(
          icon:const Icon(Icons.settings,color: Colors.grey,),
          activeIcon: Icon(Icons.settings,color: primaryColor,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}

