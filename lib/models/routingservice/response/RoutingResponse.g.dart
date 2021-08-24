// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RoutingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutingResponse _$RoutingResponseFromJson(Map<String, dynamic> json) =>
    RoutingResponse(
      (json['routes'] as List<dynamic>)
          .map((e) => RoutingResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoutingResponseToJson(RoutingResponse instance) =>
    <String, dynamic>{
      'routes': instance.routes.map((e) => e.toJson()).toList(),
    };
