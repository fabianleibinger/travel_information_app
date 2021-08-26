import 'package:json_annotation/json_annotation.dart';

part 'RoutingResultSegment.g.dart';

@JsonSerializable()
class RoutingResultSegment {
  static const double DOUBLE_DEFAULT = -1.0;

  @JsonKey(defaultValue: "")
  String encodedPolyline;
  @JsonKey(defaultValue: DOUBLE_DEFAULT)
  double durationInMinutes;
  @JsonKey(defaultValue: DOUBLE_DEFAULT)
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
  @JsonKey(defaultValue: DOUBLE_DEFAULT)
  double ascent;
  @JsonKey(defaultValue: DOUBLE_DEFAULT)
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