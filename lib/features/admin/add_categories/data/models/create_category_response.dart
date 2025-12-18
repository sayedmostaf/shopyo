import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_category_response.g.dart';

@JsonSerializable()
class CreateCategoryResponse {
  CreateCategoryResponse(this.data);
  final CreateCategoryData data;
  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseFromJson(json);
}

@JsonSerializable()
class CreateCategoryData {
  CreateCategoryData(this.createModel);
  @JsonKey(name: 'addCategory')
  final CreateCategoryModel createModel;
  factory CreateCategoryData.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDataFromJson(json);
}

@JsonSerializable()
class CreateCategoryModel {
  final String? id, name, image;
  CreateCategoryModel(this.id, this.name, this.image);
  factory CreateCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryModelFromJson(json);
}
