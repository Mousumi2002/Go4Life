import 'package:flutter/material.dart';



  // ignore: non_constant_identifier_names
  AppBar AppBarTitle() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.location_pin,
          color: Color.fromRGBO(12, 97, 255, 0.612),
          size: 35.0,
        ),
        title: const Text("Kolkata,700028",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 19.0,
                backgroundColor: Colors.white)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/go_icon.png',
            ),
          ),
        ],
      );
  }
