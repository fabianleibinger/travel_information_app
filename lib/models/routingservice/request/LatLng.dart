import 'package:json_annotation/json_annotation.dart';

part 'LatLng.g.dart';

@JsonSerializable()
class LatLng {
  double lat;
  double lng;

  LatLng(this.lat, this.lng);

  factory LatLng.fromJson(Map<String, dynamic> json) =>
      _$LatLngFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngToJson(this);
}