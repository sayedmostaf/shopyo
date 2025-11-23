import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_request_body.g.dart';

@JsonSerializable()
class CreateProductRequestBody {
  final String title;
  final double price;
  final List<String> imageList;
  final String description;
  final double categoryId;

  CreateProductRequestBody({
    required this.title,
    required this.price,
    required this.imageList,
    required this.description,
    required this.categoryId,
  });
  Map<String, dynamic> toJson() => _$CreateProductRequestBodyToJson(this);
}
