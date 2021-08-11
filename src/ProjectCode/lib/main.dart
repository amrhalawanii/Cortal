import 'package:cortal/Pages/Registration/Login/LoginPage.dart';
import 'package:cortal/Pages/Splashpage/SplashPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cortal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFFAD1B02),
        ),
        home: SplashPage());
  }
}
