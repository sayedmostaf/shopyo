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
        child: ValueListenableBuilder(
          valueListenable:
              FirebaseCloudMessaging.instance.isNotificationSubscribed,
          builder: (_, value, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value ? 'Subscribe' : 'Unsubscribe',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(width: 20),
                Transform.scale(
                  scale: 1.4,
                  child: Switch.adaptive(
                    value: value,
                    activeColor: Colors.green,
                    inactiveTrackColor: Color(0xff262626),
                    onChanged: (value) async {
                      await FirebaseCloudMessaging.instance
                          .controllerForUserSubscribe();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
