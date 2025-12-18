import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_categories_response.g.dart';

@JsonSerializable()
class GetAllCategoriesResponse {
  GetAllCategoriesResponse(this.data);
  final GetAllCategoriesData data;
  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);
  List<GetAllCategoriesModel> get getAllCategoriesList {
    if (data.categoriesList.isEmpty) {
      return [];
    }
    return data.categoriesList.reversed.toList();
  }

  List<String> get categoryDropdownList {
    final list = data.categoriesList.map((e) => e.name ?? '').toList();
    return list;
  }
}

@JsonSerializable()
class GetAllCategoriesData {
  GetAllCategoriesData(this.categoriesList);
  factory GetAllCategoriesData.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesDataFromJson(json);
  @JsonKey(name: 'categories')
  final List<GetAllCategoriesModel> categoriesList;
}

@JsonSerializable()
class GetAllCategoriesModel {
  final String? id, name, image;
  const GetAllCategoriesModel(this.id, this.name, this.image);
  factory GetAllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesModelFromJson(json);
}
