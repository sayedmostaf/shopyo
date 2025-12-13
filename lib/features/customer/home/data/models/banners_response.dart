import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/utils/app_strings.dart';
part 'banners_response.g.dart';

@JsonSerializable()
class BannersResponse {
  final BannersData data;
  BannersResponse(this.data);
  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
  List<String> get bannerImageList {
    final list = data.banners
        .where((e) => e.title!.contains(searchBannersKeyWord))
        .toList();
    if (list.isEmpty) {
      return [];
    }
    return list.first.images;
  }
}

@JsonSerializable()
class BannersData {
  @JsonKey(name: 'products')
  final List<BannersModel> banners;
  BannersData(this.banners);
  factory BannersData.fromJson(Map<String, dynamic> json) =>
      _$BannersDataFromJson(json);
}

@JsonSerializable()
class BannersModel {
  BannersModel(this.title, this.images);
  factory BannersModel.fromJson(Map<String, dynamic> json) =>
      _$BannersModelFromJson(json);
  final String? title;
  final List<String> images;
}
