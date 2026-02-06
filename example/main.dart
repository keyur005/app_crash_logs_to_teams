import 'package:app_crash_logs_to_teams/main.dart';
import 'package:flutter/material.dart';
import 'package:app_crash_logs_to_teams/teams_integration.dart';
import 'package:flutter/foundation.dart';

void main() {
  // Initialize the app and setup Teams logging
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Crash Logs to Teams',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Initialize Teams logging with your webhook URL
    initializeTeams();
  }

  // Function to initialize the Teams crash logging
  Future<void> initializeTeams() async {
    String teamsWebhookUrl = "YOUR_WEBHOOK_URL"; // Replace with your Teams Webhook URL

    // Customize the parameters (optional)
    String? title = "App Crash Report";
    String? subtitle = "Error details captured from app";
    String? userEmail = "user@example.com";
    String? userPhone = "123-456-7890";

    await TeamsLogger.initializeTeams(
      teamsWebhookUrl,
      title: title,
      subtitle: subtitle,
      userEmail: userEmail,
      userPhone: userPhone,
    );
  }

  // Simulating an app crash on button press (for testing purposes)
  void simulateCrash() {
    throw Exception("This is a simulated crash!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Crash Logs to Teams"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            simulateCrash();
          },
          child: Text("Simulate App Crash"),
        ),
      ),
    );
  }
}
