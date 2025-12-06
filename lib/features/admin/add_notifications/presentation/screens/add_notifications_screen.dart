import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/common/widgets/admin_app_bar.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/refactors/add_notifications_body.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<GetAllNotificationAdminBloc>()
                ..add(GetAllNotificationAdminEvent.getAllNotification()),
        ),
        BlocProvider(create: (context) => sl<AddNotificationBloc>()),
        BlocProvider(create: (context) => sl<SendNotificationBloc>()),
      ],
      child: Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Notifications',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: AddNotificationsBody(),
      ),
    );
  }
}
