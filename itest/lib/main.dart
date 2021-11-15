import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:itest/screens/home.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'DataPlan.dart';

void main() {
  runApp(MaterialApp(
    // routes: <String, WidgetBuilder>{
    //   '/launchscreen': (BuildContext context) => Home(),
    // },
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.lightBlueAccent, Color(0xff63a4ff)],
  ).createShader(Rect.fromLTWH(0.0, 1.0, 200.0, 910.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: AnimatedSplashScreen(
      //   animationDuration: Duration(
      //     milliseconds: 400
      //   ),
      //   duration: 200,
      //   // splash:
      //
      //   nextScreen: DataPlan(),
      // ),
      body: SplashScreenView(
        navigateRoute: DataPlan(),
        duration: 1600,
        imageSize: 180,
        speed: 10,
        imageSrc: "images/itest.png",
        text: "iTest",
        textStyle: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = linearGradient
        ),
        backgroundColor: Colors.white,
      )
    );
  }
}
