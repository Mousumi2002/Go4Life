import 'package:app_go/components/square_tile.dart';
import 'package:app_go/nav.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 10, 55, 214),
                ),
                hintText: 'Enter Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 10, 55, 214),
                ),
                hintText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 10, 55, 214),
              padding: EdgeInsets.symmetric(horizontal: 160, vertical: 16),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text('Login',style: TextStyle(color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              height: 20,
              thickness: 0.8,
              color: Colors.grey,
            ),
          ),
          //SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SquareTile(
              imagePath: 'assets/google.png',
              label: 'SIGN IN WITH GOOGLE',
              onTap: () => print('Hi Goggle'),
            ),
          ),
        ],
      ),
    );
  }
}
