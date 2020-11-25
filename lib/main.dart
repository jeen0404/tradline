import 'package:flutter/material.dart';
import 'package:tradline/view/route/main_rout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TradLine',

      debugShowCheckedModeBanner:
          false, // removing debuging banner  // app title

      // Theme
      theme: ThemeData.light(), // flutter defult light themedata
      darkTheme: ThemeData.dark(), // flutter defult dart theme for dark mode

      // assigning route setting to send it to main screen
      onGenerateRoute: (RouteSettings settings) => mainRoute(settings),
    );
  }
}
