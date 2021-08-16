// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PreferenceProfileAddUpdateRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferenceProfileAddUpdateRequest _$PreferenceProfileAddUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    PreferenceProfileAddUpdateRequest(
      AccessToken.fromJson(json['accessToken'] as Map<String, dynamic>),
      PreferenceProfile.fromJson(
          json['preferenceProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreferenceProfileAddUpdateRequestToJson(
        PreferenceProfileAddUpdateRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken.toJson(),
      'preferenceProfile': instance.preferenceProfile.toJson(),
    };
