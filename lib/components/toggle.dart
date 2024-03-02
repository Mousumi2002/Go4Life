import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

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
    return AnimatedToggleSwitch<int>.size(
      current: value,
      values: const [0, 1],
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
                              color: Color.lerp(Color.fromARGB(255, 10, 55, 214), Colors.white,
                                  local.animationValue,),fontSize: 12)));
                },
      style: ToggleStyle(
        borderColor: Colors.transparent,
      ),
      borderWidth: 0.0,
      styleBuilder: (i) {
        final color = Color.fromARGB(255, 10, 55, 214);
        return ToggleStyle(
          backgroundColor: color.withOpacity(0.3),
          indicatorColor: color,
        );
      },
      onChanged: (i) {
        setState(() => value = i);
        return Future<dynamic>.delayed(Duration(seconds: 1));
      },
      loading: false,
    );
  }
}
