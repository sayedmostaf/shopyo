import 'package:shopyo/core/service/push_notification/firebase_cloud_messaging.dart';

class AddNotificationDataSource {
  Future<void> sendNotifications({
    required String title,
    required String body,
    required int productId,
  }) async {
    final response = await FirebaseCloudMessaging.instance
        .sendTopicNotification(title: title, body: body, productId: productId);
    return response;
  }
}
