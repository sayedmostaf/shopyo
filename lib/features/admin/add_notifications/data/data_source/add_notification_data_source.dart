import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopyo/core/extensions/string_extension.dart';
import 'package:shopyo/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/core/utils/app_values.dart';
import 'package:shopyo/features/customer/notifications/data/models/notification_model.dart';

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

  Future<void> addNotificationsToAlUsersFirebase({
    required String title,
    required String body,
    required int productId,
  }) async {
    final notificationId = AppValues.randomStringId;
    const createAt = '';
    final users = FirebaseFirestore.instance.collection(usersCollection);
    final usersGet = await users.get();

    for (final doc in usersGet.docs) {
      await users
          .doc(doc.id)
          .collection(notificationCollection)
          .doc(notificationId)
          .set(
            NotificationModel(
              body: body,
              title: title,
              productId: productId,
              isSeen: false,
              createdAt: createAt.convertDateFormate(),
              notificationId: notificationId,
            ).toJson(),
          );
    }
  }
}
