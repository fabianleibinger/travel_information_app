# travel_information_app

This is a project developed by Fabian Leibinger in terms of his bachelor thesis at Karlruhe Institut für Technologie (KIT) in cooperation with Forschungszentrum Informatik (FZI).
A flutter project.

The travel information app serves as the frontend of the travel information system, and therefore accesses the MobilityGateway via Http.
The MobilityGateway is a gateway to a preference service and the RoutingGateway.
The smartphone app, which is available for iOS and Android, is able to build routing requests according to the mobility preferences of a user.
After receiving a response, the app displays calculated routes and supports the user on the trip.

## backend

ApiProvider offers the connection to the MobilityGateway. It enables the travel_information_app to send basic Http requests by specifying path and payload.

## models

This folder hosts all the data transfer objects needed for the communication with the backend services including request and response specifications.
In addition Models consists of the global app theme and basic forms, which serve as building blocks for ui elements of the app. 
At last the singleton user class represents the current user of the app and saves runtime information.

## routes

Routes class handles all the information that is needed to navigate between different pages of the app.

## user interface

Divided by the different pages of the app, this folder saves all the ui widgets.
AppDrawer is the side navigation bar of the app, which enables navigating between different pages.
LoginPage is used to log onto the preference service.
MapPage is the main page of the app, consisting of a map, the user location and start and destination text fields.
PreferenceProfilesPage enables the user to access and edit preference profiles of the preference service. To be implemented.
routepages display calculated routes to support the user on a trip.
SettingsPage contains basic settings and a log out button.
SignupPage enables signing up to the preference service.
UserProfilePage enables the user to access and edit his/her user profile.
