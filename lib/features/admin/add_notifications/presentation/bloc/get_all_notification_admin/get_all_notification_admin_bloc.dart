import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/hive/hive_database.dart';
import 'package:shopyo/features/admin/add_notifications/data/models/add_notification_model.dart';

part 'get_all_notification_admin_event.dart';
part 'get_all_notification_admin_state.dart';
part 'get_all_notification_admin_bloc.freezed.dart';

class GetAllNotificationAdminBloc
    extends Bloc<GetAllNotificationAdminEvent, GetAllNotificationAdminState> {
  GetAllNotificationAdminBloc()
    : super(const GetAllNotificationAdminState.loading()) {
    on<FetchAllNotificationAdminEvent>(_getAllNotification);
  }
  FutureOr<void> _getAllNotification(
    FetchAllNotificationAdminEvent event,
    Emitter<GetAllNotificationAdminState> emit,
  ) async {
    try {
      if (event.isNotLoading) {
        emit(const GetAllNotificationAdminState.loading());
      }
      final list = HiveDatabase().notificationBox!.values.toList();
      if (list.isEmpty) {
        emit(const GetAllNotificationAdminState.empty());
      } else {
        emit(GetAllNotificationAdminState.success(notificationList: list));
      }
    } catch (e) {
      emit(GetAllNotificationAdminState.error(error: e.toString()));
    }
  }
}
