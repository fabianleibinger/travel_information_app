import 'package:json_annotation/json_annotation.dart';

import 'LatLng.dart';

part 'RoutingRequestWithoutMobilityPreferences.g.dart';

@JsonSerializable(explicitToJson: true)
class RoutingRequestWithoutMobilityPreferences {
  LatLng origin;
  LatLng destination;
  String routingService;

  RoutingRequestWithoutMobilityPreferences(
    this.origin,
    this.destination,
    this.routingService,
  );

  factory RoutingRequestWithoutMobilityPreferences.fromJson(
          Map<String, dynamic> json) =>
      _$RoutingRequestWithoutMobilityPreferencesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RoutingRequestWithoutMobilityPreferencesToJson(this);
}
