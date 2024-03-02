import 'package:app_go/components/appbar.dart';
import 'package:app_go/components/card.dart';
import 'package:app_go/pages/hos.dart';
import 'package:app_go/pages/med.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarTitle(),
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(18.0),
              child: Column(
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
                            builder: (context) => SearchMed()),
                      );
                    }),
                SizedBox(height: 10.0),
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
                    SizedBox(width: 4.0),
                    CardTile1(
                      image: 'assets/lab.jpg',
                      title: 'Laboratory',
                      tap: () => print('hello lab'),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
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
