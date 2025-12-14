import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/features/admin/add_products/data/models/get_all_product_response.dart';

part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  ProductDetailsResponse(this.data);
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  final ProductDetailsData data;
}

@JsonSerializable()
class ProductDetailsData {
  ProductDetailsData(this.productModel);

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataFromJson(json);

  @JsonKey(name: 'product')
  final ProductDetailsModel productModel;
}

@JsonSerializable()
class ProductDetailsModel {
  ProductDetailsModel(
    this.title,
    this.price,
    this.images,
    this.description,
    this.id,
    this.category,
  );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
  final String? id;
  final String? title;
  final double? price;
  final List<String> images;
  final String? description;
  final CategoryDetailModel? category;
}

@JsonSerializable()
class CategoryDetailModel {
  CategoryDetailModel(this.name);

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailModelFromJson(json);

  final String name;
}
