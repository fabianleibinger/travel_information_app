// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PreferenceProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferenceProfile _$PreferenceProfileFromJson(Map<String, dynamic> json) =>
    PreferenceProfile(
      ConnectionPreferences.fromJson(
          json['connectionPreferences'] as Map<String, dynamic>),
      json['cyclingPace'] as int,
      (json['demandedComfortFactors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      json['levelOfIntermodality'] as int,
      json['luggageSize'] as int,
      (json['maxCyclingDistance'] as num).toDouble(),
      (json['maxWalkingDistance'] as num).toDouble(),
      ModePreferences.fromJson(json['modePreferences'] as Map<String, dynamic>),
      json['noCyclingInBadWeather'] as bool,
      json['profileName'] as String,
      (json['timeframe'] as List<dynamic>).map((e) => e as String).toList(),
      json['walkingPace'] as int,
      RouteOptimizationWeighting.fromJson(
          json['weighting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreferenceProfileToJson(PreferenceProfile instance) =>
    <String, dynamic>{
      'connectionPreferences': instance.connectionPreferences.toJson(),
      'cyclingPace': instance.cyclingPace,
      'demandedComfortFactors': instance.demandedComfortFactors,
      'levelOfIntermodality': instance.levelOfIntermodality,
      'luggageSize': instance.luggageSize,
      'maxCyclingDistance': instance.maxCyclingDistance,
      'maxWalkingDistance': instance.maxWalkingDistance,
      'modePreferences': instance.modePreferences.toJson(),
      'noCyclingInBadWeather': instance.noCyclingInBadWeather,
      'profileName': instance.profileName,
      'timeframe': instance.timeframe,
      'walkingPace': instance.walkingPace,
      'weighting': instance.weighting.toJson(),
    };
