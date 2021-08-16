import 'package:json_annotation/json_annotation.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/ConnectionPreferences.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/ModePreferences.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/RouteOptimizationWeighting.dart';

part 'PreferenceProfile.g.dart';

@JsonSerializable(explicitToJson: true)
class PreferenceProfile {
  ConnectionPreferences connectionPreferences;
  //1-3
  int cyclingPace;
  List<String> demandedComfortFactors;
  //1-50
  int levelOfIntermodality;
  //1-3
  int luggageSize;
  //1-500
  double maxCyclingDistance;
  //1-50
  double maxWalkingDistance;
  ModePreferences modePreferences;
  bool noCyclingInBadWeather;
  String profileName;
  List<String> timeframe;
  //1-3
  int walkingPace;
  RouteOptimizationWeighting weighting;

  PreferenceProfile(
      this.connectionPreferences,
      this.cyclingPace,
      this.demandedComfortFactors,
      this.levelOfIntermodality,
      this.luggageSize,
      this.maxCyclingDistance,
      this.maxWalkingDistance,
      this.modePreferences,
      this.noCyclingInBadWeather,
      this.profileName,
      this.timeframe,
      this.walkingPace,
      this.weighting);

  factory PreferenceProfile.fromJson(Map<String, dynamic> json) =>
      _$PreferenceProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceProfileToJson(this);
}
