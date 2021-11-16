import 'package:flutter/cupertino.dart';
import 'package:itest/constants/palette.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter/material.dart';

class ProgressBar {
  LinearPercentIndicator showBar(double displayPer) {
    return  LinearPercentIndicator(
      width: 300,
      lineHeight: 24.0,
      curve: Curves.easeIn,
      percent: displayPer / 100.0,
      center: Text(
        displayPer.toStringAsFixed(1) + "%",
        style:  TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
      linearGradient: LinearGradient(
        colors: [CupertinoColors.link, Colors.lightBlue],

      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: Colors.grey.shade100,
      // progressColor: Colors.lightBlueAccent,
    );
  }
}
