import 'package:json_annotation/json_annotation.dart';

part 'GoogleLatLng.g.dart';

@JsonSerializable()
class GoogleLatLng {
  double lat;
  double lng;

  GoogleLatLng(this.lat, this.lng);

  factory GoogleLatLng.fromJson(Map<String, dynamic> json) =>
      _$GoogleLatLngFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleLatLngToJson(this);
}