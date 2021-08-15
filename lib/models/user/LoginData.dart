import 'package:json_annotation/json_annotation.dart';

part 'LoginData.g.dart';

@JsonSerializable()
class LoginData {
  String name;
  String email;

  LoginData(this.name, this.email);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
