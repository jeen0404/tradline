import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradline/cubit/app_start_cubit.dart';
import 'package:tradline/view/ui/screen/main_screen.dart';

//  spash screen
class SplashScreen extends StatefulWidget {
  static const String route = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppStartCubit _appStartCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("TradLine", style: GoogleFonts.pacifico(fontSize: 30)),
      ),
    );
  }
}
