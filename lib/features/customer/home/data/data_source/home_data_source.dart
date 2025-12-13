import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/customer/home_queries.dart';
import 'package:shopyo/features/customer/home/data/models/banners_response.dart';

class HomeDataSource {
  final ApiService _graphql;
  HomeDataSource(this._graphql);
  Future<BannersResponse> getBanners() async {
    final response = await _graphql.getBanners(
      HomeQueries().getBannersMapQuery(),
    );
    return response;
  }
}
