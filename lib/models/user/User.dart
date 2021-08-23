import 'package:travel_information_app/models/preferenceservice/user/login/AccessToken.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/PreferenceProfile.dart';

/// Singleton class for the current user of the app.
class User {
  static User _instance = User._internal();

  factory User() => _instance;

  User._internal();

  /// Access token for the backend service.
  AccessToken? _accessToken;
  PreferenceProfile? _preferenceProfile;
  String? _routingService;

  /// Checks if accessToken is available.
  bool isLoggedIn() {
    bool isLoggedIn = true;
    try {
      this.getAccessToken();
    } on TypeError catch (e) {
      isLoggedIn = false;
    }
    return isLoggedIn;
  }

  /// Creates new instance, deletes all saved variables.
  logout() {
    _instance = User._internal();
  }

  /// Returns the name of the preference profile null-safe.
  String receivePreferenceProfileName() {
    String name;
    try {
      name = this.getPreferenceProfile().profileName;
    } on TypeError catch (e) {
      name = "";
    }
    return name;
  }

  /// Returns the name of the routing service null-safe.
  String receiveRoutingService() {
    String name;
    try {
      name = this.getRoutingService();
    } on TypeError catch (e) {
      name = "";
    }
    return name;
  }

  AccessToken getAccessToken() {
    return _accessToken!;
  }

  void setAccessToken(AccessToken token) {
    _accessToken = token;
  }

  PreferenceProfile getPreferenceProfile() {
    return _preferenceProfile!;
  }

  void setPreferenceProfile(PreferenceProfile profile) {
    _preferenceProfile = profile;
  }

  String getRoutingService() {
    return _routingService!;
  }

  void setRoutingService(String name) {
    _routingService = name;
  }
}
