// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccessToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      json['access_token'] as String,
      json['token_type'] as String,
      json['expires_in'] as int,
      json['scope'] as String,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
      'scope': instance.scope,
    };
