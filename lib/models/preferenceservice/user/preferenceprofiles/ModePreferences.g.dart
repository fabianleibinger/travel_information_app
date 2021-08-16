// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModePreferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModePreferences _$ModePreferencesFromJson(Map<String, dynamic> json) =>
    ModePreferences(
      (json['excludedModes'] as List<dynamic>).map((e) => e as String).toList(),
      (json['neutralModes'] as List<dynamic>).map((e) => e as String).toList(),
      (json['preferredModes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ModePreferencesToJson(ModePreferences instance) =>
    <String, dynamic>{
      'excludedModes': instance.excludedModes,
      'neutralModes': instance.neutralModes,
      'preferredModes': instance.preferredModes,
    };
