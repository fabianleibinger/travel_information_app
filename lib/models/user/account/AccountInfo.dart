import 'package:json_annotation/json_annotation.dart';

part 'AccountInfo.g.dart';

@JsonSerializable()
class AccountInfo {
  String fullname;
  String role;
  String username;

  AccountInfo(this.fullname, this.role, this.username);

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);
}
