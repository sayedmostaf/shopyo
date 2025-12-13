import 'package:shopyo/core/service/graphql/api_service.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/admin/categories_queries.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/admin/products_queries.dart';
import 'package:shopyo/core/service/graphql/qraphql_queries/customer/home_queries.dart';
import 'package:shopyo/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';
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

  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await _graphql.getAllCategories(
      CategoriesQueries().getAllCategoriesQuery(),
    );
    return response;
  }

  Future<GetAllProductResponse> getAllProducts() async {
    final response = await _graphql.getAllProducts(
      ProductsQueries().getAllProductsQuery(),
    );
    return response;
  }
}
