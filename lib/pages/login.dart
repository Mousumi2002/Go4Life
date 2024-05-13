import 'package:app_go/components/toggle.dart';
import 'package:app_go/controller/login_page.dart';
import 'package:app_go/pages/sign_in.dart';
import 'package:app_go/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageController = Get.put(LoginPageController());
    return Obx(() => SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/go_icon.png',
                  width: 100,
                  height: 95,
                ),
                SizedBox(height: 12),
                Togglebutton(),
                SizedBox(height: 5),
                loginPageController.isSignIn.value ? SignIn() : SignUp(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

