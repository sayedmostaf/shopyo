import 'package:flutter/material.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/service/push_notification/firebase_cloud_messaging.dart';

class HomeCustomerScreen extends StatelessWidget {
  const HomeCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
        backgroundColor: context.color.mainColor,

        title: Text('Home Customer', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                await FirebaseCloudMessaging.instance.subscribeNotification();
              },
              child: Text(
                'Subscribe Notification',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseCloudMessaging.instance.unsubscribeNotification();
              },
              child: Text(
                'Unsubscribe',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
