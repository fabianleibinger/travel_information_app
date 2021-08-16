import 'package:json_annotation/json_annotation.dart';
import 'package:travel_information_app/models/preferenceservice/user/login/AccessToken.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/PreferenceProfile.dart';

part 'PreferenceProfileAddUpdateRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class PreferenceProfileAddUpdateRequest {
  AccessToken accessToken;
  PreferenceProfile preferenceProfile;

  PreferenceProfileAddUpdateRequest(this.accessToken, this.preferenceProfile);

  factory PreferenceProfileAddUpdateRequest.fromJson(
          Map<String, dynamic> json) =>
      _$PreferenceProfileAddUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PreferenceProfileAddUpdateRequestToJson(this);
}
