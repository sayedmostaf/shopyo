import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/widgets/custom_container_linear_admin.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/extensions/date_extension.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/widgets/delete/delete_notification_widget.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/widgets/edit/edit_notification.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/widgets/send/send_notification_widget.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({
    super.key,
    required this.notificationModel,
    required this.index,
  });
  final AddNotificationModel notificationModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            Spacer(),
            NotificationInfo(title: 'Title: ', body: notificationModel.title),
            Spacer(),
            NotificationInfo(title: 'Body: ', body: notificationModel.body),
            Spacer(),
            NotificationInfo(
              title: 'Created At: ',
              body: notificationModel.createAt.getFormatDayMonthYear(),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DeleteNotificationWidget(notificationModel: notificationModel),
                SizedBox(width: 40.w),
                EditNotification(notificationModel: notificationModel),
                SizedBox(width: 40.w),
                SendNotificationWidget(
                  notificationModel: notificationModel,
                  index: index,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({super.key, required this.title, required this.body});
  final String title, body;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            color: Colors.white,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        SizedBox(height: 8.w),

        TextApp(
          text: body,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            color: ColorsDark.blueLight,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ],
    );
  }
}
