import 'package:json_annotation/json_annotation.dart';
import 'package:travel_information_app/models/preferenceservice/user/login/AccessToken.dart';

part 'AccountPutRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountPutRequest {
  String fullname;
  String password;
  AccessToken accessToken;

  AccountPutRequest(this.fullname, this.password, this.accessToken);

  factory AccountPutRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountPutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountPutRequestToJson(this);
}
