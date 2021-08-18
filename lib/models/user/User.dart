import 'package:travel_information_app/models/preferenceservice/user/login/AccessToken.dart';

/// Singleton class for the current user of the app.
class User {
  static User _instance = User._internal();

  factory User() => _instance;

  User._internal();

  /// Access token for the backend service.
  AccessToken? _accessToken;

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

  logout() {
    _instance = User._internal();
  }

  AccessToken getAccessToken() {
    return _accessToken!;
  }

  void setAccessToken(AccessToken value) {
    _accessToken = value;
  }
}
