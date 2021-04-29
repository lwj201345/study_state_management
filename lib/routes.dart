import 'package:flutter/material.dart';
import 'package:study_state_management/ui/home_screen.dart';

class ScreenRoutes {
  static final home = '/';
  static final homeScreen = '/home_screen';
  static final pageTwo = '/page_two';

  static final initialRoute = home;

  static final Map<String, WidgetBuilder> routes = {
    // ScreenRoutes.pageTwo: (context) => PageTwo(),
    ScreenRoutes.homeScreen: (context) => HomeScreen(),
  };
}
