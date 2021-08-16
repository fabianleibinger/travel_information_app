import 'package:json_annotation/json_annotation.dart';

part 'LoginRequest.g.dart';

@JsonSerializable()
class LoginRequest {
  String username;
  String password;

  LoginRequest(this.username, this.password);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
