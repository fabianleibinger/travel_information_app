import 'package:json_annotation/json_annotation.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResultSegment.dart';

part 'RoutingResult.g.dart';

@JsonSerializable(explicitToJson: true)
class RoutingResult {
  String encodedPolyline;
  double durationInMinutes;
  double distanceInMeters;
  String departureTime;
  String arrivalTime;
  int numberOfTransfers;
  List<RoutingResultSegment> segments;

  RoutingResult(
      this.encodedPolyline,
      this.durationInMinutes,
      this.distanceInMeters,
      this.departureTime,
      this.arrivalTime,
      this.numberOfTransfers,
      this.segments);

  factory RoutingResult.fromJson(Map<String, dynamic> json) =>
      _$RoutingResultFromJson(json);

  Map<String, dynamic> toJson() => _$RoutingResultToJson(this);
}
