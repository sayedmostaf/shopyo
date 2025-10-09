import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_number_response.g.dart';

@JsonSerializable()
class CategoriesNumberResponse {
  final CategoriesNumberData data;
  CategoriesNumberResponse(this.data);
  factory CategoriesNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberResponseFromJson(json);
  String get categoriesNumbers {
    if (data.cateogriesList.isNotEmpty) {
      return '0';
    }
    return data.cateogriesList.length.toString();
  }
}

@JsonSerializable()
class CategoriesNumberData {
  CategoriesNumberData(this.cateogriesList);
  factory CategoriesNumberData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberDataFromJson(json);
  @JsonKey(name: 'categories')
  final List<CategoriesNumberModel> cateogriesList;
}

@JsonSerializable()
class CategoriesNumberModel {
  final String? name;
  CategoriesNumberModel(this.name);
  factory CategoriesNumberModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberModelFromJson(json);
}
