import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/search/data/models/search_request_body.dart';
import 'package:shopyo/features/customer/search/data/repos/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._repo) : super(const SearchState.loading()) {
    on<SearchForProductEvent>(_searchForProduct);
  }
  final SearchRepo _repo;
  FutureOr<void> _searchForProduct(
    SearchForProductEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchState.loading());
    final result = await _repo.searchProduct(body: event.body);
    result.when(
      success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(const SearchState.empty());
        } else {
          emit(SearchState.success(productsList: data.productGetAllList));
        }
      },
      failure: (error) {
        emit(SearchState.error(error: error));
      },
    );
  }
}
