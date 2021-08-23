import 'package:json_annotation/json_annotation.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/PreferenceProfile.dart';
import 'package:travel_information_app/models/preferenceservice/user/profile/UserProfile.dart';
import 'package:travel_information_app/models/routingservice/GoogleLatLng.dart';

part 'RoutingRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class RoutingRequest {
  GoogleLatLng origin;
  GoogleLatLng destination;
  String routingService;
  PreferenceProfile preferenceProfile;
  UserProfile userProfile;

  RoutingRequest(
    this.origin,
    this.destination,
    this.routingService,
    this.preferenceProfile,
    this.userProfile,
  );

  factory RoutingRequest.fromJson(Map<String, dynamic> json) =>
      _$RoutingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RoutingRequestToJson(this);
}