import 'package:hive_flutter/adapters.dart';
import 'package:shopyo/features/admin/add_notifications/data/models/add_notification_model.dart';

class HiveDatabase {
  HiveDatabase._();
  factory HiveDatabase() => _instance;
  static final HiveDatabase _instance = HiveDatabase._();
  Box<AddNotificationModel>? notificationBox;
  Future<void> setup() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AddNotificationModelAdapter());
    notificationBox = await Hive.openBox<AddNotificationModel>(
      'notification_box',
    );
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
  }
}
