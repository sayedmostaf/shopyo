import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/data/repos/categories_admin_repo.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';
part 'create_category_bloc.freezed.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this._repo) : super(_Initial()) {
    on<NewCreateCategoryEvent>(_createCategory);
  }
  final CategoriesAdminRepo _repo;

  FutureOr<void> _createCategory(
    NewCreateCategoryEvent event,
    Emitter<CreateCategoryState> emit,
  ) async {
    emit(CreateCategoryState.loading());
    final result = await _repo.createCategory(body: event.body);
    result.when(
      success: (data) {
        emit(CreateCategoryState.success());
      },
      failure: (error) {
        emit(CreateCategoryState.error(error: error));
      },
    );
  }
}
