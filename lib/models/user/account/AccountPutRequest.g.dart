// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountPutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountPutRequest _$AccountPutRequestFromJson(Map<String, dynamic> json) =>
    AccountPutRequest(
      json['fullname'] as String,
      json['password'] as String,
      AccessToken.fromJson(json['accessToken'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountPutRequestToJson(AccountPutRequest instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'password': instance.password,
      'accessToken': instance.accessToken.toJson(),
    };
