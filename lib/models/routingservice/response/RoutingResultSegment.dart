import 'package:json_annotation/json_annotation.dart';

part 'RoutingResultSegment.g.dart';

@JsonSerializable()
class RoutingResultSegment {
  String encodedPolyline;
  double durationInMinutes;
  double distanceInMeters;
  String modeOfTransport;
  List<String> instructions;
  List<String> warnings;
  String departureTime;
  String arrivalTime;
  double ascent;

  RoutingResultSegment(
      this.encodedPolyline,
      this.durationInMinutes,
      this.distanceInMeters,
      this.modeOfTransport,
      this.instructions,
      this.warnings,
      this.departureTime,
      this.arrivalTime,
      this.ascent);

  factory RoutingResultSegment.fromJson(Map<String, dynamic> json) =>
      _$RoutingResultSegmentFromJson(json);

  Map<String, dynamic> toJson() => _$RoutingResultSegmentToJson(this);
}