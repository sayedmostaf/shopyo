import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/core/service/push_notification/local_notfication_service.dart';

class FirebaseMessagingNavigate {
  // foreground
  static Future<void> forGroundHandler(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotificationService.showSimpleNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        payload: message.data['productId'].toString(),
      );
    }
  }

  // background
  static void backgroundHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  // terminate
  static void terminateHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  static void _navigate(RemoteMessage message) {
    if (int.parse(message.data['productId'].toString()) == -1) return;
    sl<GlobalKey<NavigatorState>>().currentState!.context.pushName(
      AppRoutes.productDetails,
      arguments: int.parse(message.data['productId'].toString()),
    );
  }
}
