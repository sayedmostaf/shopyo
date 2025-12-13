import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
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
}
