import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopyo/core/service/shared_pref/pref_keys.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/customer/notifications/data/models/notification_model.dart';

class NotificationController {
  NotificationController();
  final notificationDatabase = FirebaseFirestore.instance
      .collection(usersCollection)
      .doc(SharedPref().getInt(PrefKeys.userId).toString())
      .collection(notificationCollection)
      .orderBy('created_at', descending: true);
  Stream<List<NotificationModel>> getNotificationList() {
    return notificationDatabase.snapshots().map((value) {
      return value.docs.map((doc) {
        final data = doc.data();
        return NotificationModel.fromJson(data);
      }).toList();
    });
  }
}
