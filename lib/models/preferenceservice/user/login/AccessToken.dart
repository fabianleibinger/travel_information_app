import 'package:json_annotation/json_annotation.dart';

part 'AccessToken.g.dart';

@JsonSerializable()
class AccessToken {
  String access_token;
  String token_type;
  int expires_in;
  String scope;

  AccessToken(this.access_token, this.token_type, this.expires_in, this.scope);

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
