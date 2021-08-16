import 'package:json_annotation/json_annotation.dart';

import 'AccessToken.dart';

part 'LoginResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  String username;
  String password;
  AccessToken accessToken;

  LoginResponse(this.username, this.password, this.accessToken);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
