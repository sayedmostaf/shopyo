import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body.g.dart';
@JsonSerializable()
class SignUpRequestBody {
  final String name,email,password,avatar;
  SignUpRequestBody({required this.name,required this.email,required this.password,required this.avatar});
  Map<String,dynamic>toJson()=>_$SignUpRequestBodyToJson(this);
}