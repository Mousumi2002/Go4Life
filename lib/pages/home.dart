import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/card.dart';
import 'package:app_go/pages/hos.dart';
import 'package:app_go/pages/med.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBarTitle(),
        body: Column(children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(18.0),
              child: const Column(
                children: <Widget>[
                  Text('Assistance',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color.fromRGBO(6, 50, 206, 0.612),
                      ))
                ],
              ),
              ),
          Container(
            child: Column(
              children: [
                CardTile(
                    image: 'assets/med.jpg',
                    title: 'Medicine',
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchMed()),
                      );
                    }),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardTile1(
                      image: 'assets/hospital.jpg',
                      title: 'Hospital',
                      tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  TabControl()),
                      );
                    }),
                    const SizedBox(width: 4.0),
                    CardTile1(
                      image: 'assets/lab.jpg',
                      title: 'Laboratory',
                      tap: () => print('hello lab'),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                CardTile(
                  image: 'assets/blood.jpg',
                  title: 'Go4Blood',
                  tap: () => print('Hello life'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
