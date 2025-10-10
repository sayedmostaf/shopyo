import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/add_categories/data/repos/categories_admin_repo.dart';

part 'delete_category_event.dart';
part 'delete_category_state.dart';
part 'delete_category_bloc.freezed.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this._repo) : super(_Initial()) {
    on<RemoveCategoryEvent>(_deleteCategory);
  }
  final CategoriesAdminRepo _repo;

  FutureOr<void> _deleteCategory(
    RemoveCategoryEvent event,
    Emitter<DeleteCategoryState> emit,
  ) async {
    emit(DeleteCategoryState.loading(categoryId: event.categoryId));
    final result = await _repo.deleteCategory(categoryIds: event.categoryId);
    result.when(
      success: (_) {
        emit(DeleteCategoryState.success());
      },
      failure: (error) {
        emit(DeleteCategoryState.error(error: error));
      },
    );
  }
}
