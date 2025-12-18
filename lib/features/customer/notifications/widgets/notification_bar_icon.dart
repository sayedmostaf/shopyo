import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/core/style/images/app_images.dart';
import 'package:shopyo/features/customer/notifications/data/models/notification_model.dart';
import 'package:shopyo/features/customer/notifications/presentation/controller/notifcaiton_controller.dart';

class NotificationBarIcon extends StatelessWidget {
  const NotificationBarIcon({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationModel>>(
      stream: NotificationController().getNotificationList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox.shrink();
        }
        final numberOfNotifications = snapshot.data!
            .where((e) => e.isSeen == false)
            .length;
        return badge.Badge(
          showBadge: numberOfNotifications != 0,
          badgeAnimation: badge.BadgeAnimation.scale(),
          position: badge.BadgePosition.topEnd(end: -4.w, top: -8.h),
          badgeContent: TextApp(
            text: numberOfNotifications >= 9
                ? '9+'
                : numberOfNotifications.toString(),
            theme: context.textStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeightHelper.bold,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
          ),
          badgeStyle: badge.BadgeStyle(
            badgeColor: Colors.pink,
            padding: EdgeInsets.all(5.h),
            elevation: 0,
          ),
          child: SvgPicture.asset(
            AppImages.notificationIcon,
            color: isSelected ? context.color.navBarSelectedTab : Colors.grey,
            height: 25.h,
          ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
        );
      },
    );
  }
}
