// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductRequestBody _$UpdateProductRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateProductRequestBody(
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  imageList: (json['imageList'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  description: json['description'] as String,
  productId: json['productId'] as String,
  categoryId: (json['categoryId'] as num).toDouble(),
);

Map<String, dynamic> _$UpdateProductRequestBodyToJson(
  UpdateProductRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'price': instance.price,
  'imageList': instance.imageList,
  'description': instance.description,
  'productId': instance.productId,
  'categoryId': instance.categoryId,
};
