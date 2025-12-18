import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_category_request_body.g.dart';

@JsonSerializable()
class UpdateCategoryRequestBody {
  final String name, image, id;
  const UpdateCategoryRequestBody({
    required this.name,
    required this.image,
    required this.id,
  });
  Map<String, dynamic> toJson() => _$UpdateCategoryRequestBodyToJson(this);
}
