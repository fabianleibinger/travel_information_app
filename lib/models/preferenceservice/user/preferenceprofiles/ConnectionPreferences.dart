import 'package:json_annotation/json_annotation.dart';

part 'ConnectionPreferences.g.dart';

@JsonSerializable()
class ConnectionPreferences {
  //in minutes
  int maxConnectingTime;
  int maxNumOfChanges;
  //in minutes
  int minConnectingTime;
  bool minimizeChanges;

  ConnectionPreferences(this.maxConnectingTime, this.maxNumOfChanges,
      this.minConnectingTime, this.minimizeChanges);

  factory ConnectionPreferences.fromJson(Map<String, dynamic> json) =>
      _$ConnectionPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionPreferencesToJson(this);
}
