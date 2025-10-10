import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:shopyo/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:shopyo/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/create/create_category.dart';

class CategoriesAdminRepo {
  final CategoriesAdminDataSource _dataSource;
  CategoriesAdminRepo(this._dataSource);

  Future<ApiResult<GetAllCategoriesResponse>> getAllCategoriesAdmin() async {
    try {
      final response = await _dataSource.getAllCategoriesAdmin();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<CreateCategoryResponse>> createCategory({
    required CreateCategoryRequestBody body,
  }) async {
    try {
      final response = await _dataSource.createCategory(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<ApiResult<void>> deleteCategory({required String categoryIds}) async {
    try {
      final response = await _dataSource.deleteCategory(categoryIds);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }
}
