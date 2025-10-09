import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'users_number_event.dart';
part 'users_number_state.dart';
part 'users_number_bloc.freezed.dart';

class UsersNumberBloc extends Bloc<UsersNumberEvent, UsersNumberState> {
  UsersNumberBloc(this._repo) : super(UsersNumberState.loading()) {
    on<UsersNumberEvent>(_getUsersNumber);
  }
  final DashboardRepo _repo;
  FutureOr<void> _getUsersNumber(
    UsersNumberEvent event,
    Emitter<UsersNumberState> emit,
  ) async {
    emit(const UsersNumberState.loading());
    final result = await _repo.numberOfUsers();
    result.when(
      success: (usersData) {
        emit(UsersNumberState.success(numbers: usersData.usersNumbers));
      },
      failure: (error) {
        emit(UsersNumberState.error(error: error));
      },
    );
  }
}
