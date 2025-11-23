import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';

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
}
