import 'package:json_annotation/json_annotation.dart';

part 'NameList.g.dart';

@JsonSerializable()
class NameList {
  List<String> names;

  NameList(this.names);

  factory NameList.fromJson(Map<String, dynamic> json) =>
      _$NameListFromJson(json);

  Map<String, dynamic> toJson() => _$NameListToJson(this);
}
