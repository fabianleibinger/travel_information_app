// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConnectionPreferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionPreferences _$ConnectionPreferencesFromJson(
        Map<String, dynamic> json) =>
    ConnectionPreferences(
      json['maxConnectingTime'] as int,
      json['maxNumOfChanges'] as int,
      json['minConnectingTime'] as int,
      json['minimizeChanges'] as bool,
    );

Map<String, dynamic> _$ConnectionPreferencesToJson(
        ConnectionPreferences instance) =>
    <String, dynamic>{
      'maxConnectingTime': instance.maxConnectingTime,
      'maxNumOfChanges': instance.maxNumOfChanges,
      'minConnectingTime': instance.minConnectingTime,
      'minimizeChanges': instance.minimizeChanges,
    };
