import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:shopyo/features/admin/add_products/data/repos/products_admin_repo.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';
part 'create_product_bloc.freezed.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc(this._repo) : super(_Initial()) {
    on<NewCreateProductEvent>(_createProduct);
  }
  final ProductsAdminRepo _repo;
  FutureOr<void> _createProduct(
    NewCreateProductEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(CreateProductState.loading());
    final result = await _repo.createProductsAdmin(body: event.body);
    result.when(
      success: (_) {
        emit(CreateProductState.success());
      },
      failure: (error) {
        emit(CreateProductState.error(error: error));
      },
    );
  }
}
