import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPlan extends StatefulWidget {


  @override
  _DataPlanState createState() => _DataPlanState();
}

class _DataPlanState extends State<DataPlan> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Your Speed Limit"),

            Row(
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
                            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Speed limit',
                                    hintText: '10'
                                ))))),
              ],
            )
          ],
        )
      ),
    );
  }
}
