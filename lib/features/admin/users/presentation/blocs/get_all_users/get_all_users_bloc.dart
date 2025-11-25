import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/users/data/models/get_all_users_response.dart';
import 'package:shopyo/features/admin/users/data/repos/users_repo.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc(this._repo) : super(GetAllUsersState.loading()) {
    on<FetchAllUsersEvent>(_getAllUsers);
    on<SearchForUserEvent>(_searchForUser);
  }
  final UsersRepo _repo;
  final TextEditingController searchController = TextEditingController();
  List<UsersModel> userList = [];
  FutureOr<void> _getAllUsers(
    FetchAllUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    if (event.isNotLoading) {
      emit(const GetAllUsersState.loading());
    }
    final result = await _repo.getAllUsers();
    result.when(
      success: (users) {
        if (users.data.usersList.isEmpty) {
          emit(const GetAllUsersState.empty());
        } else {
          userList = users.data.usersList;
          emit(GetAllUsersState.success(userList: users.data.usersList));
        }
      },
      failure: (error) {
        emit(GetAllUsersState.error(error: error));
      },
    );
  }

  FutureOr<void> _searchForUser(
    SearchForUserEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    final searchResult = userList
        .where(
          (e) =>
              e.name!.toLowerCase().startsWith(
                event.searchName!.toLowerCase().trim(),
              ) ||
              e.email!.toLowerCase().startsWith(
                event.searchName!.toLowerCase().trim(),
              ),
        )
        .toList();
    if (searchResult.isEmpty) {
      emit(const GetAllUsersState.empty());
    } else {
      emit(GetAllUsersState.search(userList: searchResult));
    }
  }
}
