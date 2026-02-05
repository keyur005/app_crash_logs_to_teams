import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CommonConst{
  CommonConst._();
  static String platform = Platform.isAndroid ? "Android" : "iOS";

  static final instance = CommonConst._();
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
  String? appVersion;



  Future<void> config() async {
    //PackageInfo packageInfo = await PackageInfo.fromPlatform();


    if (Platform.isAndroid) {
      androidInfo = await deviceInfoPlugin.androidInfo;
      //deviceId=androidInfo?.id??"";

    } else {
      iosInfo = await deviceInfoPlugin.iosInfo;
      //deviceId=iosInfo?.identifierForVendor??"";

    }

   // await SharedPrefUtils.setVersionCode(appVersions);
    //await SharedPrefUtils.setDeviceID(deviceId);
  }

}