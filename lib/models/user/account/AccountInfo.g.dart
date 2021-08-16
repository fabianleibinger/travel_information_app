// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) => AccountInfo(
      json['fullname'] as String,
      json['role'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'role': instance.role,
      'username': instance.username,
    };
