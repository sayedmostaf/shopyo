import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/category/data/data_source/category_data_source.dart';

class CategoryRepo {
  final CategoryDataSource _dataSource;
  CategoryRepo(this._dataSource);

  Future<ApiResult<GetAllProductResponse>> getCategory({
    required int categoryId,
  }) async {
    try {
      final response = await _dataSource.getCategory(categoryId: categoryId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
