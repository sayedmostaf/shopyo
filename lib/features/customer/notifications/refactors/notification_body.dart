import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/core/service/shared_pref/pref_keys.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/customer/notifications/presentation/controller/notifcaiton_controller.dart';
import 'package:shopyo/features/customer/notifications/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: StreamBuilder(
        stream: NotificationController().getNotificationList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notification_add,
                    color: context.color.textColor,
                    size: 150,
                  ),
                  TextApp(
                    text: 'You Not Has Notifications Now',
                    theme: context.textStyle.copyWith(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return NotificationItem(
                title: snapshot.data![index].title,
                body: snapshot.data![index].body,
                createdAt: snapshot.data![index].createdAt,
                isSeen: snapshot.data![index].isSeen,
                onTapSelected: () async {
                  await FirebaseFirestore.instance
                      .collection(usersCollection)
                      .doc(SharedPref().getInt(PrefKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .update({'isSeen': true});
                  if (snapshot.data![index].productId != -1) {
                    if (!context.mounted) return;
                    await context.pushName(
                      AppRoutes.productDetails,
                      arguments: snapshot.data![index].productId,
                    );
                  }
                },
                onTapRemoved: () async {
                  await FirebaseFirestore.instance
                      .collection(usersCollection)
                      .doc(SharedPref().getInt(PrefKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .delete();
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
          );
        },
      ),
    );
  }
}
