import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/search/data/data_source/search_data_source.dart';
import 'package:shopyo/features/customer/search/data/models/search_request_body.dart';

class SearchRepo {
  final SearchDataSource _dataSource;
  SearchRepo(this._dataSource);
  Future<ApiResult<GetAllProductResponse>> searchProduct({
    required SearchRequestBody body,
  }) async {
    try {
      final response = await _dataSource.searchProduct(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
