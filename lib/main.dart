import 'package:app_crash_logs_to_teams/const.dart';
import 'package:app_crash_logs_to_teams/teams_integration.dart';
import 'package:flutter/foundation.dart';

class TeamsLogger {
  // Method to initialize Teams logging
  static Future<void> initializeTeams(String teamsUrl,{String? title,String? subtitle, String? userEmail, String? userPhone, String? apiBaseUrl, String? userToken}) async {
    await Future.delayed(const Duration(seconds: 1));
    await AppConst.instance.config();

    // Customize the FlutterError handling
    FlutterError.onError = (details) {
      PostToTeams post = getPostToTeams(logsToTeams: details.toString(),title: title,subtitle: subtitle,userEmail: userEmail,userPhone: userPhone,apiBaseUrl: apiBaseUrl,userToken: userToken);
      FlutterError.presentError(details);
     // if (!kDebugMode) {
        sendLogsToTeams(post.toJson(), teamsUrl);
     // }
    };

    // Customize the platform error handling
    PlatformDispatcher.instance.onError = (error, stack) {
     // if (!kDebugMode) {
        PostToTeams post = getPostToTeams(logsToTeams: error.toString() + stack.toString(),title: title,subtitle: subtitle,userEmail: userEmail,userPhone: userPhone,apiBaseUrl: apiBaseUrl,userToken: userToken);
        sendLogsToTeams(post.toJson(), teamsUrl);
     // }
      return true;
    };
  }


}

/*
3.44.0

git add .
 git commit -m"Upgrade app_crash_logs_to_teams to 1.0.7"
 git tag v1.0.7
 git push origin main --tags
 fvm dart pub publish

$env:Path += ";C:\Users\barav\AppData\Local\Pub\Cache\bin"
fvm --version
fvm install 3.44.0

git --version
dart pub global activate fvm
*/




