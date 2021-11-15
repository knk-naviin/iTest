import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_core/core.dart';

import 'DataPlan.dart';

void main() {

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MyApp(),
      )


  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

Stack(
children: [
Padding(
padding: const EdgeInsets.only(top: 28.0),
child: Image.asset("images/itest.png"),
),
Padding(
padding: const EdgeInsets.only(top: 308.0),
child: Center(
child: Text(
'iTest',
style: TextStyle(
fontSize: 50.0,
fontWeight: FontWeight.bold,
foreground: Paint()..shader = linearGradient),
),
),
),
],
)
