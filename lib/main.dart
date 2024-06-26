// ignore_for_file: prefer_const_constructors

import 'package:app_go/firebase_options.dart';
import 'package:app_go/pages/splash_screen.dart';
import 'package:app_go/provider/auth_provider.dart';
import 'package:app_go/provider/cart_provider.dart';
import 'package:app_go/provider/doctor_provider.dart';
import 'package:app_go/provider/medicine_provider.dart';
import 'package:app_go/provider/vendor_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => MedicineProvider()),
        ChangeNotifierProvider(create: (_) => VendorProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}