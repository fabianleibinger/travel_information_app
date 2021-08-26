import 'package:travel_information_app/userinterface/routepages/routesegmentviewpage/RouteSegmentViewPage.dart';
import 'package:travel_information_app/userinterface/routepages/routespage/RoutesPage.dart';
import 'package:travel_information_app/userinterface/routepages/routeviewpage/RouteViewPage.dart';
import 'package:travel_information_app/userinterface/userprofilepage/UserProfilePage.dart';
import 'package:travel_information_app/userinterface/loginpage/LoginPage.dart';
import 'package:travel_information_app/userinterface/mappage/MapPage.dart';
import 'package:travel_information_app/userinterface/preferenceprofilespage/PreferenceProfilesPage.dart';
import 'package:travel_information_app/userinterface/settingspage/SettingsPage.dart';
import 'package:travel_information_app/userinterface/settingspage/accountpage/AccountPage.dart';
import 'package:travel_information_app/userinterface/signuppage/SignupPage.dart';

/// Route information for navigating through widgets.
class Routes {
  static const String account = AccountPage.routeName;
  static const String login = LoginPage.routeName;
  static const String map = MapPage.routeName;
  static const String preferenceProfiles = PreferenceProfilesPage.routeName;
  static const String routes = RoutesPage.routeName;
  static const String routeView = RouteViewPage.routeName;
  static const String segmentView = RouteSegmentViewPage.routeName;
  static const String settings = SettingsPage.routeName;
  static const String signup = SignupPage.routeName;
  static const String userProfile = UserProfilePage.routeName;
}