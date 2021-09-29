
import 'package:app_mobile/pages/auth/auth_screen.dart';
import 'package:app_mobile/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  AuthScreen.routeName: (context) => AuthScreen(),
};
