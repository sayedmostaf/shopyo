import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/customer/products_view_all/data/repos/products_view_all_repo.dart';
import 'package:shopyo/features/customer/products_view_all/presentation/bloc/products_view_all_bloc/products_view_all_event.dart';
import 'package:shopyo/features/customer/products_view_all/presentation/bloc/products_view_all_bloc/products_view_all_state.dart';

class ProductsViewAllBloc
    extends Bloc<ProductsViewAllEvent, ProductsViewAllState> {
  final ProductsViewAllRepo _repo;
  ProductsViewAllBloc(this._repo)
    : super(
        const ProductsViewAllInitialState(productsList: [], hasMoreData: true),
      ) {
    on<GetProductsViewAllEvent>(_getProductsViewAll);
    on<LoadMoreProductsEvent>(_loadMoreProducts);
  }
  int offset = 6;
  FutureOr<void> _getProductsViewAll(
    GetProductsViewAllEvent event,
    Emitter<ProductsViewAllState> emit,
  ) async {
    emit(ProductsViewAllLoadingState(hasMoreData: true, productsList: []));
    final result = await _repo.getProductViewAll(offset: 0);
    result.when(
      success: (data) {
        emit(
          ProductsViewAllSuccessState(
            hasMoreData: true,
            productsList: data.productGetAllList,
          ),
        );
      },
      failure: (error) {
        emit(
          ProductsViewAllErrorState(
            errorMessage: error,
            hasMoreData: true,
            productsList: state.productsList,
          ),
        );
      },
    );
  }

  FutureOr<void> _loadMoreProducts(
    LoadMoreProductsEvent event,
    Emitter<ProductsViewAllState> emit,
  ) async {
    if (!state.hasMoreData) return;
    offset += 6;
    emit(
      ProductsViewAllLoadingState(
        hasMoreData: state.hasMoreData,
        productsList: state.productsList,
      ),
    );
    final result = await _repo.getProductViewAll(offset: offset);
    result.when(
      success: (data) {
        final newList = [...state.productsList, ...data.productGetAllList];
        emit(
          ProductsViewAllSuccessState(
            hasMoreData: !(data.productGetAllList.length < 6),
            productsList: newList,
          ),
        );
      },
      failure: (error) {
        emit(
          ProductsViewAllErrorState(
            errorMessage: error,
            hasMoreData: state.hasMoreData,
            productsList: state.productsList,
          ),
        );
      },
    );
  }
}
