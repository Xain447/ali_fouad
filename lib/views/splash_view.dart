
import 'dart:async';
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/src/utils/asset_manager.dart';
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AssetManager.logo,
      nextScreen: const App(),
      duration: 2000,
      splashIconSize: ValueManager.vm200,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: ColorManager.whiteColor,
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    checkLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  checkLoggedIn(BuildContext context) async{
    SharedPreferences prefInst = await SharedPreferences.getInstance();
    String? token =  prefInst.getString("token");
    Timer(const Duration(milliseconds: 10), () {
      if(token != null){
        Navigator.pushReplacementNamed(context, Pages.home);
      }else{
        Navigator.pushReplacementNamed(context, Pages.landing);
      }
    });
  }
}


