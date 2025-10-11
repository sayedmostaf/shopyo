import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/data/repos/categories_admin_repo.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/create_category/create_category_bloc.dart';

part 'update_category_event.dart';
part 'update_category_state.dart';
part 'update_category_bloc.freezed.dart';

class UpdateCategoryBloc
    extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  UpdateCategoryBloc(this._repo) : super(_Initial()) {
    on<NewUpdateCategoryEvent>(_updateCategory);
  }
  final CategoriesAdminRepo _repo;
  FutureOr<void> _updateCategory(
    NewUpdateCategoryEvent event,
    Emitter<UpdateCategoryState> emit,
  ) async {
    emit(const UpdateCategoryState.loading());

    final result = await _repo.updateCategory(body: event.body);

    result.when(
      success: (_) {
        emit(const UpdateCategoryState.success());
      },
      failure: (error) {
        emit(UpdateCategoryState.error(error: error));
      },
    );
  }
}
