import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_go/pages/login.dart';
import 'package:app_go/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Image.asset('assets/go_icon.png',width: 200,height: 200,),
      )
     ,nextScreen: WelcomeScreenState(),
     duration: 3000,
     backgroundColor: Colors.white,
     splashTransition: SplashTransition.fadeTransition,
     splashIconSize: 200,);
  }
}