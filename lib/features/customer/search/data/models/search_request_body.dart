import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request_body.g.dart';

@JsonSerializable()
class SearchRequestBody {
  final String? searchName;
  final int? priceMin, priceMax;
  const SearchRequestBody({
    required this.searchName,
    required this.priceMin,
    required this.priceMax,
  });
  Map<String, dynamic> toJson() => _$SearchRequestBodyToJson(this);
}
