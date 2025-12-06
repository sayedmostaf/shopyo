import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:shopyo/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/widgets/edit/edit_notification_bottom_sheet.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({super.key, required this.notificationModel});
  final AddNotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomBottomSheet.showModalBottomSheetContainer(
          context: context,
          widget: EditNotificationBottomSheet(
            notificationModel: notificationModel,
          ),
          whenComplete: () {
            context.read<GetAllNotificationAdminBloc>().add(
              GetAllNotificationAdminEvent.getAllNotification(),
            );
          },
        );
      },
      child: Icon(Icons.edit, color: Colors.yellow),
    );
  }
}
