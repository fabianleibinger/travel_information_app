import 'package:json_annotation/json_annotation.dart';

part 'RoutingResultSegment.g.dart';

@JsonSerializable()
class RoutingResultSegment {
  @JsonKey(defaultValue: "")
  String encodedPolyline;
  @JsonKey(defaultValue: -1.0)
  double durationInMinutes;
  @JsonKey(defaultValue: -1.0)
  double distanceInMeters;
  @JsonKey(defaultValue: "")
  String modeOfTransport;
  @JsonKey(defaultValue: [])
  List<String> instructions;
  @JsonKey(defaultValue: [])
  List<String> warnings;
  @JsonKey(defaultValue: "")
  String departureTime;
  @JsonKey(defaultValue: "")
  String arrivalTime;
  @JsonKey(defaultValue: -1.0)
  double ascent;
  @JsonKey(defaultValue: -1.0)
  double descent;

  RoutingResultSegment(
      this.encodedPolyline,
      this.durationInMinutes,
      this.distanceInMeters,
      this.modeOfTransport,
      this.instructions,
      this.warnings,
      this.departureTime,
      this.arrivalTime,
      this.ascent,
      this.descent);

  factory RoutingResultSegment.fromJson(Map<String, dynamic> json) =>
      _$RoutingResultSegmentFromJson(json);

  Map<String, dynamic> toJson() => _$RoutingResultSegmentToJson(this);
}