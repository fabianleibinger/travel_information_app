// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RouteOptimizationWeighting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteOptimizationWeighting _$RouteOptimizationWeightingFromJson(
        Map<String, dynamic> json) =>
    RouteOptimizationWeighting(
      (json['comfort'] as num).toDouble(),
      (json['duration'] as num).toDouble(),
      (json['environment'] as num).toDouble(),
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$RouteOptimizationWeightingToJson(
        RouteOptimizationWeighting instance) =>
    <String, dynamic>{
      'comfort': instance.comfort,
      'duration': instance.duration,
      'environment': instance.environment,
      'price': instance.price,
    };
