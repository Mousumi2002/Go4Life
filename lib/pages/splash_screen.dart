import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_go/nav.dart';
import 'package:app_go/pages/welcome_page.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool? isSignIn;
  @override
  void initState() {
    loginCheck();
    super.initState();
  }
  void loginCheck() async{
    final ap = Provider.of<AuthProvider>(context, listen: false);
    await ap.checkSignIn();
    setState(()=>isSignIn = ap.isSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(isSignIn == null){
      return const Scaffold(
        body: CircularProgressIndicator(),
      );
    }
    return AnimatedSplashScreen(
      splash: Center(
        child: Image.asset('assets/go_icon.png',width: 200,height: 200,),
      )
     ,nextScreen: isSignIn ?? false ? const HomePage() : const WelcomeScreenState(),
     duration: 3000,
     backgroundColor: Colors.white,
     splashTransition: SplashTransition.fadeTransition,
     splashIconSize: 200,);
  }
}