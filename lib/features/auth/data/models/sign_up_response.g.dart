// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(AddUserModel.fromJson(json['data'] as Map<String, dynamic>));

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{'data': instance.data};

AddUserModel _$AddUserModelFromJson(Map<String, dynamic> json) =>
    AddUserModel(json['id'] as String?, json['email'] as String?);

Map<String, dynamic> _$AddUserModelToJson(AddUserModel instance) =>
    <String, dynamic>{'id': instance.id, 'email': instance.email};
