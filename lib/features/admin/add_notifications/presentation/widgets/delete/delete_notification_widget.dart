import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';

class DeleteNotificationWidget extends StatelessWidget {
  const DeleteNotificationWidget({super.key, required this.notificationModel});
  final AddNotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationBloc, AddNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllNotificationAdminBloc>().add(
              const GetAllNotificationAdminEvent.getAllNotification(),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return SizedBox(
              height: 15.h,
              width: 15.w,
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
          orElse: () {
            return InkWell(
              onTap: () {
                context.read<AddNotificationBloc>().add(
                  AddNotificationEvent.deleteNotification(
                    notificationModel: notificationModel,
                  ),
                );
              },
              child: Icon(Icons.delete, color: Colors.red),
            );
          },
        );
      },
    );
  }
}
