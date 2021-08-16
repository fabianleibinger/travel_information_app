import 'package:json_annotation/json_annotation.dart';
import 'package:travel_information_app/models/user/login/AccessToken.dart';

part 'StandardRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class StandardRequest {
  AccessToken accessToken;

  StandardRequest(this.accessToken);

  factory StandardRequest.fromJson(Map<String, dynamic> json) =>
      _$StandardRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StandardRequestToJson(this);
}
