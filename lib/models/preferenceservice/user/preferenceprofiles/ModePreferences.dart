import 'package:json_annotation/json_annotation.dart';

part 'ModePreferences.g.dart';

@JsonSerializable()
class ModePreferences {
  List<String> excludedModes;
  List<String> neutralModes;
  List<String> preferredModes;

  ModePreferences(this.excludedModes, this.neutralModes, this.preferredModes);

  factory ModePreferences.fromJson(Map<String, dynamic> json) =>
      _$ModePreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$ModePreferencesToJson(this);
}
