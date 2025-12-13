import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/category/data/repos/category_repo.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';
part 'get_category_bloc.freezed.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  GetCategoryBloc(this._repo) : super(const GetCategoryState.loading()) {
    on<FetchCategoryEvent>(_getCategory);
  }
  final CategoryRepo _repo;

  FutureOr<void> _getCategory(
    FetchCategoryEvent event,
    Emitter<GetCategoryState> emit,
  ) async {
    emit(const GetCategoryState.loading());
    final result = await _repo.getCategory(categoryId: event.categoryId);
    result.when(
      success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(const GetCategoryState.empty());
        } else {
          emit(GetCategoryState.success(productsList: data.productGetAllList));
        }
      },
      failure: (error) {
        emit(GetCategoryState.error(error: error));
      },
    );
  }
}
