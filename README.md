# App Crash Logs to Teams

This Dart package sends app crash logs and error details to Microsoft Teams for monitoring and reporting. It integrates easily with your Flutter application to capture errors and automatically send logs to a Microsoft Teams channel.

## Features
- Capture app crashes and Flutter framework errors.
- Send detailed error logs to Microsoft Teams.
- Configurable to use your own Teams webhook URL.

## Installation

1. Add this package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     app_crash_logs_to_teams: ^1.0.0

## Setting Up Microsoft Teams

To send crash logs to a Microsoft Teams channel, you'll need to set up a webhook in the channel.

## Step 1: Create a Microsoft Teams Channel

You can create either a public or private channel. Here's how:
- Creating a Public Channel:

1. Open Microsoft Teams.
2. Go to the team where you want to add the channel.
3. Click on the `More options` (three dots) next to the team name.
4. Select `Add channel.`
5. Fill in the channel name and description.
6. Set the `Privacy` to `Standard - Accessible to everyone in the team.`
7. Click `Create.`

- Creating a Private Channel:

1. Open Microsoft Teams.
2. Go to the team where you want to add the channel.
3. Click on the `More options` (three dots) next to the team name.
4. Select `Add channel.`
5. Fill in the channel name and description.
6. Set the `Privacy` to `Private - Only accessible to a specific group of people within the team.`
7. Select the members you want to give access to.
8. Click `Create.`


## Step 2: Add Incoming Webhook to the Channel

1. Go to the channel you just created.
2. Click on the `More options` (three dots) next to the channel name.
3. Select `Connectors.`
4. In the search bar, type "Incoming Webhook" and select it.
5. Click `Add.`
6. Provide a name for the webhook (e.g., "Crash Logs Webhook").
7. You can also upload an image to be displayed with the messages.
8.  Click `Create.`


## Step 3: Get the Webhook URL

- Once the webhook is created:

1. Copy the `Webhook URL.` This URL will be used to send the crash logs to the Microsoft Teams channel.


## Step 4: Use the Webhook URL in Your App

Once you have the Webhook URL, configure the `app_crash_logs_to_teams` package in your Flutter app by adding the URL to the configuration:


1. Add this package to your `pubspec.yaml` file:

   ```yaml
   import 'package:app_crash_logs_to_teams/app_crash_logs_to_teams.dart';

     void main() {
        TeamsLogger.initializeTeams('YOUR_WEBHOOK_URL');
        runApp(const MyApp());
       }

- Replace 'YOUR_WEBHOOK_URL' with the URL you copied earlier
   
## License
- This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.