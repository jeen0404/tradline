import 'package:flutter/material.dart';
import 'package:tradline/view/ui/screen/create_portfolio_screen.dart';
import 'package:tradline/view/ui/screen/main_screen.dart';

Route<dynamic> mainRoute(RouteSettings routeSettings) {
  //final arguments = routeSettings.arguments;

  /// for handline parms

  switch (routeSettings.name) {

    case CreatePortfolioScreen.route:
      return MaterialPageRoute(builder: (_)=>CreatePortfolioScreen());

    /// in dafult route user will land in main screen
    default:
      return MaterialPageRoute(builder: (_) => MainScreen());
  }
}
