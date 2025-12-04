import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/widgets/custom_container_linear_admin.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/widgets/edit/edit_notification.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({super.key});

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
            NotificationInfo(title: 'Title: ', body: 'viewafd'),
            Spacer(),
            NotificationInfo(title: 'Body: ', body: 'body adsfdfafad'),
            Spacer(),
            NotificationInfo(title: 'Created At: ', body: '17-2-2024'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 40.w),
                EditNotification(),
                SizedBox(width: 40.w),
                Icon(Icons.send, color: Colors.green),
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
