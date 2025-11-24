import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_product_request_body.g.dart';

@JsonSerializable()
class UpdateProductRequestBody {
  UpdateProductRequestBody({
    required this.title,
    required this.price,
    required this.imageList,
    required this.description,
    required this.productId,
    required this.categoryId,
  });
  final String title;
  final double price;
  final List<String> imageList;
  final String description;
  final String productId;
  final double categoryId;
  Map<String, dynamic> toJson() => _$UpdateProductRequestBodyToJson(this);
}
