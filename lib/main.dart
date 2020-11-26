import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradline/cubit/app_start_cubit.dart';
import 'package:tradline/view/route/main_rout.dart';
import 'package:tradline/view/ui/screen/auth/screen/name_input_screen.dart';
import 'package:tradline/view/ui/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppStartCubit _appStartCubit;

  @override
  void initState() {
    _appStartCubit = AppStartCubit();
    super.initState();
    _appStartCubit.add(AppStartCubitEvent.AppStartedAppStartCubitEvent);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppStartCubit>(
        create: (context) => _appStartCubit,
        child: BlocBuilder<AppStartCubit, AppStartCubitState>(
          cubit: _appStartCubit,
          builder: (context, state) {
            if (state == AppStartCubitState.AuthenticatedAppStartCubitState)
              return Authenticated();
            else if (state ==
                AppStartCubitState.UnAuthenticatedAppStartCubitState)
              return UnAuthenticated();
            else {
              return SplashScreenApp();
            }
          },
        ));
  }
}

// UnAuthenticated MaterialApp
class UnAuthenticated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TradLine',
        debugShowCheckedModeBanner:
            false, // removing debuging banner  // app title
        // Theme
        theme: ThemeData.light(), // flutter defult light themedata
        darkTheme: ThemeData.dark(), // flutter defult dark theme for dark mode
        home: NameInputScreen());
  }
}

// AuthenticatedApp or main app
class Authenticated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TradLine',
      debugShowCheckedModeBanner:
          false, // removing debuging banner  // app title
      // Theme
      theme: ThemeData.light(), // flutter defult light themedata
      darkTheme: ThemeData.dark(), // flutter defult dark theme for dark mode

      // assigning route setting to send it to main screen
      onGenerateRoute: (RouteSettings settings) => mainRoute(settings),
    );
  }
}

// Splash screen app
class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TradLine',
        debugShowCheckedModeBanner:
            false, // removing debuging banner  // app title
        // Theme
        theme: ThemeData.light(), // flutter defult light themedata
        darkTheme: ThemeData.dark(), // flutter defult dark theme for dark mode
        home: SplashScreen());
  }
}
