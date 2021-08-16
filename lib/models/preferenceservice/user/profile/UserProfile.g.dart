// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      json['accessibility'] as bool,
      json['canRideABike'] as bool,
      json['grantGPS'] as bool,
      json['hasDriversLicence'] as bool,
      json['privateBicycleAvailable'] as bool,
      json['privateCarAvailable'] as bool,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'accessibility': instance.accessibility,
      'canRideABike': instance.canRideABike,
      'grantGPS': instance.grantGPS,
      'hasDriversLicence': instance.hasDriversLicence,
      'privateBicycleAvailable': instance.privateBicycleAvailable,
      'privateCarAvailable': instance.privateCarAvailable,
    };
