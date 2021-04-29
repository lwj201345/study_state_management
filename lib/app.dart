import 'package:flutter/material.dart';
import 'package:study_state_management/routes.dart';
import 'package:study_state_management/ui/auth_screen.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      home: AuthScreen(),
      initialRoute: ScreenRoutes.initialRoute,
      routes: ScreenRoutes.routes,
    );
  }
}
