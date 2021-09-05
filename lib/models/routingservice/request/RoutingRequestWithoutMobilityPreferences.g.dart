// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoutingRequestWithoutMobilityPreferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutingRequestWithoutMobilityPreferences
    _$RoutingRequestWithoutMobilityPreferencesFromJson(
            Map<String, dynamic> json) =>
        RoutingRequestWithoutMobilityPreferences(
          LatLng.fromJson(json['origin'] as Map<String, dynamic>),
          LatLng.fromJson(json['destination'] as Map<String, dynamic>),
          json['routingService'] as String,
        );

Map<String, dynamic> _$RoutingRequestWithoutMobilityPreferencesToJson(
        RoutingRequestWithoutMobilityPreferences instance) =>
    <String, dynamic>{
      'origin': instance.origin.toJson(),
      'destination': instance.destination.toJson(),
      'routingService': instance.routingService,
    };
