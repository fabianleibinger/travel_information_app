// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoutingResultSegment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutingResultSegment _$RoutingResultSegmentFromJson(
        Map<String, dynamic> json) =>
    RoutingResultSegment(
      json['encodedPolyline'] as String? ?? '',
      (json['durationInMinutes'] as num?)?.toDouble() ?? -1.0,
      (json['distanceInMeters'] as num?)?.toDouble() ?? -1.0,
      json['modeOfTransport'] as String? ?? '',
      (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      (json['warnings'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      json['departureTime'] as String? ?? '',
      json['arrivalTime'] as String? ?? '',
      (json['ascent'] as num?)?.toDouble() ?? -1.0,
      (json['descent'] as num?)?.toDouble() ?? -1.0,
    );

Map<String, dynamic> _$RoutingResultSegmentToJson(
        RoutingResultSegment instance) =>
    <String, dynamic>{
      'encodedPolyline': instance.encodedPolyline,
      'durationInMinutes': instance.durationInMinutes,
      'distanceInMeters': instance.distanceInMeters,
      'modeOfTransport': instance.modeOfTransport,
      'instructions': instance.instructions,
      'warnings': instance.warnings,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'ascent': instance.ascent,
      'descent': instance.descent,
    };
