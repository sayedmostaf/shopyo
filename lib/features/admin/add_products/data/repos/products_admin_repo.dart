import 'package:dio/dio.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:shopyo/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/admin/add_products/data/models/update_product_request_body.dart';

class ProductsAdminRepo {
  final ProductsAdminDataSource _dataSource;
  ProductsAdminRepo(this._dataSource);
  Future<ApiResult<GetAllProductResponse>> getAllProductsAdmin() async {
    try {
      final response = await _dataSource.getAllProductsAdmin();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<void>> createProductsAdmin({
    required CreateProductRequestBody body,
  }) async {
    try {
      final response = await _dataSource.createProductsAdmin(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<void>> deleteProducts({required String productId}) async {
    try {
      final response = await _dataSource.deleteProducts(productId: productId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<void>> updateProductsAdmin({
    required UpdateProductRequestBody body,
  }) async {
    try {
      final response = await _dataSource.updateProductsAdmin(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
