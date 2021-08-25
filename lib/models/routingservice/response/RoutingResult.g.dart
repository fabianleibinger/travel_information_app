// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoutingResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutingResult _$RoutingResultFromJson(Map<String, dynamic> json) =>
    RoutingResult(
      json['encodedPolyline'] as String? ?? '',
      (json['durationInMinutes'] as num?)?.toDouble() ?? -1.0,
      (json['distanceInMeters'] as num?)?.toDouble() ?? -1.0,
      json['departureTime'] as String? ?? '',
      json['arrivalTime'] as String? ?? '',
      json['numberOfTransfers'] as int? ?? -1,
      (json['segments'] as List<dynamic>?)
              ?.map((e) =>
                  RoutingResultSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RoutingResultToJson(RoutingResult instance) =>
    <String, dynamic>{
      'encodedPolyline': instance.encodedPolyline,
      'durationInMinutes': instance.durationInMinutes,
      'distanceInMeters': instance.distanceInMeters,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'numberOfTransfers': instance.numberOfTransfers,
      'segments': instance.segments.map((e) => e.toJson()).toList(),
    };
