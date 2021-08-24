import 'package:json_annotation/json_annotation.dart';

import 'RoutingResult.dart';

part 'RoutingResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class RoutingResponse {
  List<RoutingResult> routes;

  RoutingResponse(this.routes);

  factory RoutingResponse.fromJson(Map<String, dynamic> json) =>
      _$RoutingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoutingResponseToJson(this);
}