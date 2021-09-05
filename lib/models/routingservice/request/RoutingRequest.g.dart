// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoutingRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutingRequest _$RoutingRequestFromJson(Map<String, dynamic> json) =>
    RoutingRequest(
      LatLng.fromJson(json['origin'] as Map<String, dynamic>),
      LatLng.fromJson(json['destination'] as Map<String, dynamic>),
      json['routingService'] as String,
      PreferenceProfile.fromJson(
          json['preferenceProfile'] as Map<String, dynamic>),
      UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoutingRequestToJson(RoutingRequest instance) =>
    <String, dynamic>{
      'origin': instance.origin.toJson(),
      'destination': instance.destination.toJson(),
      'routingService': instance.routingService,
      'preferenceProfile': instance.preferenceProfile.toJson(),
      'userProfile': instance.userProfile.toJson(),
    };
