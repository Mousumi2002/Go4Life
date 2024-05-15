import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app_go/controller/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Togglebutton extends StatefulWidget {
  const Togglebutton({super.key});

  @override
  State<Togglebutton> createState() => _TogglebuttonState();
}

class _TogglebuttonState extends State<Togglebutton> {
  int value = 0;
  int? nullableValue;
  bool positive = false;
  //bool loading = false;
  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageController  = Get.put(LoginPageController());
    return Obx(() => AnimatedToggleSwitch<bool>.size(
      current: loginPageController.isSignIn.value,
      values: const [true, false],
      iconOpacity: 1,
      indicatorSize: const Size.fromWidth(100),
      iconAnimationType: AnimationType.onHover,
      styleAnimationType: AnimationType.onHover,
      // iconBuilder: (value) =>
      //     Icon(value.isEven ? Icons.cancel : Icons.access_time_rounded),
      customIconBuilder: (context, local, global) {
                  final text = const ['Sign In', 'Sign Up'][local.index];
                  return Center(
                      child: Text(text,
                          style: TextStyle(
                              color: Color.lerp(const Color.fromARGB(255, 10, 55, 214), Colors.white,
                                  local.animationValue,),fontSize: 12)));
                },
      style: const ToggleStyle(
        borderColor: Colors.transparent,
      ),
      borderWidth: 0.0,
      styleBuilder: (i) {
        const color = Color.fromARGB(255, 10, 55, 214);
        return ToggleStyle(
          backgroundColor: color.withOpacity(0.3),
          indicatorColor: color,
        );
      },
      onChanged: (i) {
      loginPageController.setSignIn(i);
      /*bool isClicked = false;
      void toggleSwitched(bool value){
        setState(() {
          isClicked = !isClicked;
        });
        }*/
        // ignore: avoid_print
        print(i);
        return Future<dynamic>.delayed(const Duration(seconds: 1));
      },
      loading: false,
    ));
  }
}
