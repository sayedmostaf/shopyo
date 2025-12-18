import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

  static StreamController<NotificationResponse> streamController =
      StreamController();

  static void onTap(NotificationResponse notificationResponse) {
    // navigate to the notification screen
    streamController.add(notificationResponse);
  }

  static Future<void> showSimpleNotification() async {
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
      'shopyo-title',
      'shopyo-body',
      notificationDetails,
      payload: 'sayed mostafa',
    );
  }
}
