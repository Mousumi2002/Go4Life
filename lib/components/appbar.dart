// ignore_for_file: use_build_context_synchronously

import 'package:app_go/pages/registration.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class AppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final city =  authProvider.city;
    final pincode = authProvider.pincode;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(
        Icons.location_pin,
        color: Color.fromRGBO(12, 97, 255, 0.612),
        size: 35.0,
      ),
      title: Text("${city}, ${pincode}",
          textAlign: TextAlign.start,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 19.0, backgroundColor: Colors.white)),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextButton.icon(
                          icon: const Icon(Icons.exit_to_app_rounded),
                          onPressed: () async {
                            await context.read<AuthProvider>().logOut();
                            pushWithoutNavBar(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                          },
                          label: const Text(
                            "Log out",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          icon: Image.asset(
            'assets/go_icon.png',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(60);
  }
}

// ignore: non_constant_identifier_names