import 'dart:convert';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:shopyo/core/app/env.variables.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();
  static final FirebaseCloudMessaging instance = FirebaseCloudMessaging._();

  /// Send Notification using FCM HTTP v1
  Future<void> sendTopicNotification() async {
    try {
      // Load service account JSON from assets
      final jsonStr = await rootBundle.loadString(
        EnvVariable.instance.firebaseServiceAccountPath,
      );

      final serviceAccount = ServiceAccountCredentials.fromJson(
        json.decode(jsonStr),
      );

      final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

      // Generate OAuth client
      final client = await clientViaServiceAccount(serviceAccount, scopes);

      // API endpoint
      final url = Uri.parse(EnvVariable.instance.notificationBaseUrl);

      // Build message
      final messageBody = {
        "message": {
          "token":
              "dypyF6PXQzuNvL5TJXNjj8:APA91bHRH4zf_LAvBW74CXhFS_aarEKjWRdDUTpNyOxteZxHqtohbUVosTy6wItRONsAhgZ8XIQTkSbuMBnaYg2IA2q0FKohSlHteOh17WmBI_gNuIlYu8qyn2DF2f7jWypCoafTwLsu",
          "notification": {
            "title": "Check this Mobile (title)",
            "body": "Rich Notification testing (body)",
          },
        },
      };

      final response = await client.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(messageBody),
      );

      print("Status: ${response.statusCode}");
      print("Response: ${response.body}");

      client.close();
    } catch (e) {
      print('FCM Error => $e');
    }
  }
}
