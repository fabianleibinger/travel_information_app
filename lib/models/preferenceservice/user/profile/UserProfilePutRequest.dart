import 'package:json_annotation/json_annotation.dart';
import 'package:travel_information_app/models/preferenceservice/user/login/AccessToken.dart';
import 'UserProfile.dart';

part 'UserProfilePutRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfilePutRequest {
  AccessToken accessToken;
  UserProfile profile;

  UserProfilePutRequest(this.accessToken, this.profile);

  factory UserProfilePutRequest.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfilePutRequestToJson(this);
}
