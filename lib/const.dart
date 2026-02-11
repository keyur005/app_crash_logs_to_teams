import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class AppConst{
  AppConst._();
  static String platform = Platform.isAndroid ? "Android" : "iOS";

  static final instance = AppConst._();
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
  String? appVersion;



  Future<void> config() async {
    if (Platform.isAndroid) {
      androidInfo = await deviceInfoPlugin.androidInfo;
    } else {
      iosInfo = await deviceInfoPlugin.iosInfo;

    }
  }

}