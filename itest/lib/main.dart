import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_core/core.dart';

import 'DataPlan.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataPlan(),
    );
  }
}
