import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/widgets/create/create_notification.dart';

class AddNotificationsBody extends StatelessWidget {
  const AddNotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(children: [CreateNotification()]),
    );
  }
}
