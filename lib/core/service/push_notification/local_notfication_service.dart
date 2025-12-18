import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/routes/app_routes.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static void onTap(NotificationResponse notificationResponse) {
    // navigate to the notification screen
    if (int.parse(notificationResponse.payload.toString()) != -1) {
      sl<GlobalKey<NavigatorState>>().currentState!.pushNamed(
        AppRoutes.productDetails,
        arguments: int.parse(notificationResponse.payload.toString()),
      );
    }
  }

  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'shopyo-id',
        'shopyo-name',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
