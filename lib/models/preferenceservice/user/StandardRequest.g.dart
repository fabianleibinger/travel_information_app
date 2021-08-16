// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StandardRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardRequest _$StandardRequestFromJson(Map<String, dynamic> json) =>
    StandardRequest(
      AccessToken.fromJson(json['accessToken'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StandardRequestToJson(StandardRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken.toJson(),
    };
