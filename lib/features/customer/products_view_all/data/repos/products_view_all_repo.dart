import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/products_view_all/data/data_source/products_view_all_data_source.dart';

class ProductsViewAllRepo {
  final ProductsViewAllDataSource _dataSource;
  ProductsViewAllRepo(this._dataSource);
  Future<ApiResult<GetAllProductResponse>> getProductViewAll({
    required int offset,
  }) async {
    try {
      final response = await _dataSource.getProductsViewAll(offset: offset);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
