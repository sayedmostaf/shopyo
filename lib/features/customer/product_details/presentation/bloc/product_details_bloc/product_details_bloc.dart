import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/customer/product_details/data/models/product_details_response.dart';
import 'package:shopyo/features/customer/product_details/data/repos/product_details_repo.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this._repo) : super(const ProductDetailsState.loading()) {
    on<GetProductDetailsEvent>(_productDetails);
  }

  final ProductDetailsRepo _repo;
  FutureOr<void> _productDetails(
    GetProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsState.loading());
    final result = await _repo.productDetails(id: event.productId);
    result.when(
      success: (data) {
        emit(
          ProductDetailsState.success(
            productDetailsModel: data.data.productModel,
          ),
        );
      },
      failure: (error) {
        emit(ProductDetailsState.error(error: error));
      },
    );
  }
}
