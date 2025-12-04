import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:shopyo/core/app/env.variables.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();
  static const String subscribeKey = 'shopyo-store';

  Future<void> subscribeNotification() async {
    await FirebaseMessaging.instance.subscribeToTopic(subscribeKey);
    debugPrint('Subscribed to topic: $subscribeKey');
  }

  Future<void> unsubscribeNotification() async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscribeKey);
    debugPrint('Unsubscribed from topic: $subscribeKey');
  }

  static final FirebaseCloudMessaging instance = FirebaseCloudMessaging._();

  /// Send Notification using FCM HTTP v1
  Future<void> sendTopicNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
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

      // Build message for the subscribed topic
      final messageBody = {
        "message": {
          "topic": subscribeKey,
          "notification": {"title": title, "body": body},
          "data": {"productId": productId.toString()},
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
