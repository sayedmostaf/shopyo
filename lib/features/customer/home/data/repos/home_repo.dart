import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:shopyo/features/customer/home/data/data_source/home_data_source.dart';
import 'package:shopyo/features/customer/home/data/models/banners_response.dart';

class HomeRepo {
  final HomeDataSource _dataSource;
  HomeRepo(this._dataSource);
  Future<ApiResult<BannersResponse>> getBanners() async {
    try {
      final response = await _dataSource.getBanners();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<GetAllCategoriesResponse>> getAllCategories() async {
    try {
      final response = await _dataSource.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<GetAllProductResponse>> getAllProducts() async {
    try {
      final response = await _dataSource.getAllProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
