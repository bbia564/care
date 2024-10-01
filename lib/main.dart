import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monitoring/db_pool/db_pool.dart';
import 'package:monitoring/nav/nav_names.dart';
import 'package:monitoring/pages/widget_main/widget_main_binding.dart';
import 'package:monitoring/pages/widget_main/widget_main_view.dart';
import 'package:monitoring/pages/widget_one/one_blood/one_blood_binding.dart';
import 'package:monitoring/pages/widget_one/one_blood/one_blood_view.dart';
import 'package:monitoring/pages/widget_one/one_breathing/one_breathing_binding.dart';
import 'package:monitoring/pages/widget_one/one_breathing/one_breathing_view.dart';
import 'package:monitoring/pages/widget_one/one_heart/one_heart_binding.dart';
import 'package:monitoring/pages/widget_one/one_heart/one_heart_view.dart';
import 'package:monitoring/pages/widget_one/one_temperature/one_temperature_binding.dart';
import 'package:monitoring/pages/widget_one/one_temperature/one_temperature_view.dart';
import 'package:monitoring/pages/widget_one/widget_one_binding.dart';
import 'package:monitoring/pages/widget_one/widget_one_view.dart';
import 'package:monitoring/pages/widget_three/widget_three_binding.dart';
import 'package:monitoring/pages/widget_three/widget_three_view.dart';
import 'package:monitoring/pages/widget_two/two_blood/two_blood_binding.dart';
import 'package:monitoring/pages/widget_two/two_blood/two_blood_view.dart';
import 'package:monitoring/pages/widget_two/two_breathing/two_breathing_binding.dart';
import 'package:monitoring/pages/widget_two/two_breathing/two_breathing_view.dart';
import 'package:monitoring/pages/widget_two/two_heart/two_heart_binding.dart';
import 'package:monitoring/pages/widget_two/two_heart/two_heart_view.dart';
import 'package:monitoring/pages/widget_two/two_nos/two_nos_binding.dart';
import 'package:monitoring/pages/widget_two/two_nos/two_nos_view.dart';
import 'package:monitoring/pages/widget_two/two_temperature/two_temperature_binding.dart';
import 'package:monitoring/pages/widget_two/two_temperature/two_temperature_view.dart';
import 'package:monitoring/pages/widget_two/widget_two_binding.dart';
import 'package:monitoring/pages/widget_two/widget_two_view.dart';

import 'nav/nav_yog.dart';

Color primaryColor = const Color(0xff1fb451);
Color bgColor = const Color(0xffadadad);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBPool().init());
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Cares,
      initialRoute: NavNames.start,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Cares = [
  GetPage(name: NavNames.start, page: () => const TwoNosView(),binding: TwoNosBinding()),
  GetPage(name: NavNames.widgetMain, page: () =>WidgetMainPage(),binding: WidgetMainBinding()),
  GetPage(name: NavNames.widgetOne, page: () =>WidgetOnePage(),binding: WidgetOneBinding()),
  GetPage(name: NavNames.widgetTwo, page: () =>WidgetTwoPage(),binding: WidgetTwoBinding()),
  GetPage(name: NavNames.yoga, page: () => const NavYog()),
  GetPage(name: NavNames.widgetThree, page: () =>WidgetThreePage(),binding: WidgetThreeBinding()),
  GetPage(name: NavNames.oneBlood, page: () =>OneBloodPage(),binding: OneBloodBinding()),
  GetPage(name: NavNames.oneHeart, page: () =>OneHeartPage(),binding: OneHeartBinding()),
  GetPage(name: NavNames.oneBreathing, page: () =>OneBreathingPage(),binding: OneBreathingBinding()),
  GetPage(name: NavNames.oneTemperature, page: () =>OneTemperaturePage(),binding: OneTemperatureBinding()),
  GetPage(name: NavNames.twoBlood, page: () =>TwoBloodPage(),binding: TwoBloodBinding()),
  GetPage(name: NavNames.twoHeart, page: () =>TwoHeartPage(),binding: TwoHeartBinding()),
  GetPage(name: NavNames.twoBreathing, page: () =>TwoBreathingPage(),binding: TwoBreathingBinding()),
  GetPage(name: NavNames.twoTemperature, page: () =>TwoTemperaturePage(),binding: TwoTemperatureBinding()),
];