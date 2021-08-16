import 'package:json_annotation/json_annotation.dart';

part 'Signup.g.dart';

@JsonSerializable()
class Signup {
  String username;
  String fullname;
  String password;

  Signup(this.username, this.fullname, this.password);

  factory Signup.fromJson(Map<String, dynamic> json) => _$SignupFromJson(json);

  Map<String, dynamic> toJson() => _$SignupToJson(this);
}
