import 'dart:convert';
import 'dart:io';
import 'package:app_crash_logs_to_teams/const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostToTeams {
  String? type;
  String? context;
  String? themeColor;
  String? summary;
  List<Sections>? sections;

  PostToTeams(
      this.type, this.context, this.themeColor, this.summary, this.sections);

  PostToTeams.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    context = json['@context'];
    themeColor = json['themeColor'];
    summary = json['summary'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@type'] = type;
    data['@context'] = context;
    data['themeColor'] = themeColor;
    data['summary'] = summary;
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sections {
  String? activityTitle;
  String? activitySubtitle;
  String? activityImage;
  List<Facts>? facts;

  Sections(this.activityTitle, this.activitySubtitle, this.activityImage,
      this.facts);

  Sections.fromJson(Map<String, dynamic> json) {
    activityTitle = json['activityTitle'];
    activitySubtitle = json['activitySubtitle'];
    activityImage = json['activityImage'];
    if (json['facts'] != null) {
      facts = <Facts>[];
      json['facts'].forEach((v) {
        facts!.add(Facts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityTitle'] = activityTitle;
    data['activitySubtitle'] = activitySubtitle;
    data['activityImage'] = activityImage;
    if (facts != null) {
      data['facts'] = facts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facts {
  String? name;
  String? value;

  Facts(this.name, this.value);

  Facts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

PostToTeams getPostToTeams({required String logsToTeams, String? title,String? subtitle, String? userEmail, String? userPhone, String? apiBaseUrl, String? userToken}) {

  List<Facts>? facts = [];
  List<Sections>? sections = [];


 String type = "MessageCard";
 String context = "http://schema.org/extensions";
 String themeColor = "0076D7";
 String summary = "New Crash";
 String activityTitle = title??"";
 String activitySubtitle = subtitle ?? "Crash Type";
 String activityImage = "https://teamsnodesample.azurewebsites.net/static/img/image5.png";
  String platform = CommonConst.platform;
  String? deviceManufacturer =  CommonConst.instance.androidInfo?.manufacturer;
  String? androidDeviceName =  CommonConst.instance.androidInfo?.model;
  String? androidVersion =  CommonConst.instance.androidInfo?.version.release;
  String? iOSDeviceName =  CommonConst.instance.iosInfo?.utsname.machine;
  String? iOSVersion =  CommonConst.instance.iosInfo?.systemVersion;


  facts.add(Facts("Date", DateTime.now().toIso8601String()));
  facts.add(Facts("URL",apiBaseUrl));
  facts.add(Facts("Platform", "${CommonConst.instance.appVersion ?? ''} $platform ${Platform.localeName}"));
  facts.add(Facts("NumberOfProcessors", Platform.numberOfProcessors.toString()));
  facts.add(Facts("P version", Platform.version.toString()));

  if (Platform.isIOS) {
    facts.add(Facts("Model","${ iOSDeviceName ?? ""} ${ iOSVersion ?? ""}"));
  } else {
    facts.add(Facts("Device","${ deviceManufacturer ?? " "} ${ androidDeviceName ?? ""} $androidVersion"));
  }

  facts.add(Facts("User Details", "$userPhone $userEmail"));
  facts.add(Facts("Token", userToken));
  facts.add(Facts("Logs", logsToTeams));

  sections.add(Sections(activityTitle, activitySubtitle, activityImage, facts));

  PostToTeams post = PostToTeams(type, context, themeColor, summary, sections);
  return post;
}







Future<http.Response> sendLogsToTeams(Map<String, dynamic> logsToTeams,String teamsUrl)  async {
  String body = json.encode(logsToTeams);
  if (kDebugMode) {
    print("body $body");
  }

  http.Response response = await http.post(
      Uri.parse(teamsUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: body);
  return response;
}



