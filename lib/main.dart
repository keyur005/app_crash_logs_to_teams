/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teams_logs/teams_integration.dart';

Future<void> main() async {
  await initializeTeams();

}


Future<void> initializeTeams() async {
  await Future.delayed(const Duration(seconds: 1));
  FlutterError.onError = (details) {
    PostToTeams post = getPostToTeams(logsToTeams: details.toString());
    FlutterError.presentError(details);
    if (!kDebugMode) {sendLogsToTeams(post.toJson(),"TeamsURL");}
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    if (!kDebugMode) {
      PostToTeams post = getPostToTeams(logsToTeams: error.toString() + stack.toString());
      sendLogsToTeams(post.toJson(),"TeamsURL");
    }
    return true;
  };
}


*/
import 'package:app_crash_logs_to_teams/const.dart';
import 'package:app_crash_logs_to_teams/teams_integration.dart';
import 'package:flutter/foundation.dart';

class TeamsLogger {
  // Method to initialize Teams logging
  static Future<void> initializeTeams(String teamsUrl) async {
    await Future.delayed(const Duration(seconds: 1));
    await CommonConst.instance.config();

    // Customize the FlutterError handling
    FlutterError.onError = (details) {
      PostToTeams post = getPostToTeams(logsToTeams: details.toString());
      FlutterError.presentError(details);
      if (!kDebugMode) {
        sendLogsToTeams(post.toJson(), teamsUrl);
      }
    };

    // Customize the platform error handling
    PlatformDispatcher.instance.onError = (error, stack) {
      if (!kDebugMode) {
        PostToTeams post = getPostToTeams(logsToTeams: error.toString() + stack.toString());
        sendLogsToTeams(post.toJson(), teamsUrl);
      }
      return true;
    };
  }


}


