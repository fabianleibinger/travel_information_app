import 'package:json_annotation/json_annotation.dart';

part 'UserProfile.g.dart';

@JsonSerializable()
class UserProfile {
  bool accessibility;
  bool canRideABike;
  bool grantGPS;
  bool hasDriversLicence;
  bool privateBicycleAvailable;
  bool privateCarAvailable;

  UserProfile(
      this.accessibility,
      this.canRideABike,
      this.grantGPS,
      this.hasDriversLicence,
      this.privateBicycleAvailable,
      this.privateCarAvailable);

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
