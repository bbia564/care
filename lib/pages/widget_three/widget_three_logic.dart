import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../db_pool/db_pool.dart';

class WidgetThreeLogic extends GetxController {

  final dbPool = Get.find<DBPool>();

  cleanAllData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to delete all data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await dbPool.cleanAllData();

            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/init.png',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We provide you with records of temperature, blood oxygen, heart rate, respiration, etc."""),
      ],
      context: context,
    );
  }

}
