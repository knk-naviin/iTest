import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPlan extends StatefulWidget {
  @override
  _DataPlanState createState() => _DataPlanState();
}

class _DataPlanState extends State<DataPlan> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.lightBlueAccent, Color(0xff63a4ff)],
  ).createShader(Rect.fromLTWH(0.0, 1.0, 200.0, 910.0));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
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
              ),
            ),
            // Text("Select Your Speed Limit(optional)"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Speed limit(optional)',
                                      hintText: '1...100'))))),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(CupertinoColors.systemBlue),
                      elevation: MaterialStateProperty.all(0)),
                  onPressed: () {},
                  child: Text("Set Limit"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "*If Your Internet speed doesnt just know click below button",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey2, fontSize: 12)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "*If You Using Your Mobile network just click below button",
                    style: TextStyle(
                        color: CupertinoColors.systemGrey2, fontSize: 12),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              CupertinoColors.systemBlue),
                          elevation: MaterialStateProperty.all(0)),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/launchscreen');
                      },
                      child: Text("Check Speed"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
