import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/map/google_map_page.dart';
import 'package:flutter_app/src/pages/pages.dart';
// import 'package:flutter_app/src/pages/pages.dart' show LoginPage; // show or hide meaning show or hide with page name

class AppRoute {
  static const homeRoute = 'home';
  static const loginRoute = 'login';
  static const managementRoute = 'management';
  static const googleMapRoute = 'googleMap';

  get route => _route;

  final _route = <String, WidgetBuilder> {
    homeRoute: (context) => HomePage(),
    loginRoute: (context) => LoginPage(),
    managementRoute: (context) => ManagementPage(),
    googleMapRoute: (context) => GoogleMapPage(),
  };
}