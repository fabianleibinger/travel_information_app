// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfilePutRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfilePutRequest _$UserProfilePutRequestFromJson(
        Map<String, dynamic> json) =>
    UserProfilePutRequest(
      AccessToken.fromJson(json['accessToken'] as Map<String, dynamic>),
      UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfilePutRequestToJson(
        UserProfilePutRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken.toJson(),
      'userProfile': instance.userProfile.toJson(),
    };
