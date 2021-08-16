import 'package:json_annotation/json_annotation.dart';

part 'RouteOptimizationWeighting.g.dart';

@JsonSerializable()
class RouteOptimizationWeighting {
  //0-100
  double comfort;
  //0-100
  double duration;
  //0-100
  double environment;
  //0-100
  double price;

  RouteOptimizationWeighting(
      this.comfort, this.duration, this.environment, this.price);

  factory RouteOptimizationWeighting.fromJson(Map<String, dynamic> json) =>
      _$RouteOptimizationWeightingFromJson(json);

  Map<String, dynamic> toJson() => _$RouteOptimizationWeightingToJson(this);
}
