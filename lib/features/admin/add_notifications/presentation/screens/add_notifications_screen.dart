import 'package:flutter/material.dart';
import 'package:shopyo/core/common/widgets/admin_app_bar.dart';
import 'package:shopyo/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppBar(
        title: 'Notifications',
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            await FirebaseCloudMessaging.instance.sendTopicNotification(
              title: 'test Topic title',
              body: 'test Topic body',
              productId: -1,
            );
          },
          child: Text(
            'Notifications Screen',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
