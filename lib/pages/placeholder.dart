import 'package:app_go/components/appbar.dart';
import 'package:flutter/material.dart';

class PlaceHolderPage extends StatelessWidget {
  const PlaceHolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarTitle(),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20.0),
                child:const Column(
                  children: <Widget>[
                    Text('Assistance',style: TextStyle(fontSize: 24.0,color: Color.fromRGBO(6, 50, 206, 0.612),))
                  ],)
              ),
              const Text('PlacehOLDER'),
            ]),
        ),
      );
  }
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}