import 'package:app_go/components/custom_button.dart';
import 'package:app_go/nav.dart';
import 'package:app_go/pages/registration.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreenState extends StatelessWidget {
  const WelcomeScreenState({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context,listen: false);
    return SafeArea(child: Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.symmetric(vertical: 25,horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/login_reg.png",height: 300,),
            SizedBox(height: 20,),
            Text("Let's get started",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text("Login or sign up to explore Go4Life",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.grey
              ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: 
                CustomButton(
                  text: "Get Started", 
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage(),),);
                }
                ),
                ),
          ],
        ),),
    ),),);
  }
}