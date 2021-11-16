
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:itest/components/errorMsg.dart';
import 'package:itest/components/progressBar.dart';
import 'package:itest/constants/alertStyle.dart';
import 'package:itest/constants/testServer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatefulWidget {

  late final datalimit;

  Home({this.datalimit});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override

  final internetSpeedTest = InternetSpeedTest();
  final ProgressBar progressBar = ProgressBar();
  double downloadRate = 0;
  double uploadRate = 0;
  String downloadProgress = '0';
  String uploadProgress = '0';
  double displayRate = 0;
  String displayRateTxt = '0.0';
  double displayPer = 0;
  String unitText = 'Mb/s';

  // Using a flag to prevent the user from interrupting running tests
  bool isTesting = false;

  void protectGauge(double rate) {
    // this function prevents the needle from exceeding the maximum limit of the gauge
    if (rate > 150) {
      displayRateTxt = rate.toStringAsFixed(2);
    } else {
      displayRate = rate;
      displayRateTxt = displayRate.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("***********");
    print(widget.datalimit);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: progressBar.showBar(displayPer),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     showLabel('Download', downloadRate, unitText),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     showLabel('Upload', uploadRate, unitText),
            //   ],
            // ),
            // SfRadialGauge(
            //     title: GaugeTitle(
            //       backgroundColor: Colors.grey,
            //         text: ' ',
            //         textStyle: const TextStyle(
            //             fontSize: 20.0, fontWeight: FontWeight.bold)),
            //
            //     axes: [
            //       RadialAxis(canRotateLabels: true,
            //   showFirstLabel: true,
            //           showLabels: true,
            //
            //           showLastLabel: true,
            //           showAxisLine: false,
            //           minimum: 0,
            //           maximum: 100,
            //           axisLabelStyle: GaugeTextStyle(
            //             color: CupertinoColors.systemGrey2
            //           ),
            //           ranges: <GaugeRange>[
            //             GaugeRange(
            //                 startValue: 0,
            //                 endValue: 40,
            //
            //                 startWidth: 10,
            //                 endWidth: 10
            //             ),
            //             GaugeRange(
            //                 startValue: 40,
            //                 endValue: 50,
            //                 gradient: SweepGradient(
            //                   startAngle: 20,
            //                     endAngle: 100,
            //                     tileMode : TileMode.clamp,
            //                     colors: [
            //                       Colors.lightBlue,
            //                       Colors.white
            //                     ]
            //                 ),
            //                 startWidth: 10,
            //                 endWidth: 10
            //             ),
            //             GaugeRange(
            //                 startValue: 50,
            //                 endValue: 100,
            //                 color: Colors.white,
            //                 startWidth: 10,
            //                 endWidth: 10),
            //             GaugeRange(
            //                 startValue: 100,
            //                 endValue: 150,
            //                 color: Colors.white,
            //                 startWidth: 10,
            //                 endWidth: 10)
            //           ],
            //           pointers: <GaugePointer>[
            //             NeedlePointer(
            //
            //               knobStyle: KnobStyle(
            //                 color: Colors.grey,
            //               ),
            //               tailStyle: TailStyle(
            //                 color: Colors.red,
            //                   lengthUnit : GaugeSizeUnit.logicalPixel
            //               ),
            //               gradient: LinearGradient(
            //                 colors:   [Colors.lightBlue,CupertinoColors.link],
            //
            //               ),
            //               value: displayRate,
            //               enableAnimation: true,
            //               needleColor: CupertinoColors.systemGrey,
            //             ),
            //           ],
            //           annotations: <GaugeAnnotation>[
            //             GaugeAnnotation(
            //                 widget: Padding(
            //                   padding: const EdgeInsets.only(top: 78.0),
            //                   child: Container(
            //                     child: Text(
            //                       displayRate.toStringAsFixed(2) + ' ' + unitText,
            //                       style: TextStyle(
            //                         fontSize: 25,
            //                         fontWeight: FontWeight.bold,
            //                         color: CupertinoColors.systemGrey,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 angle: 90,
            //                 positionFactor: 0.5)
            //           ])
            //
            //     ]),
            SfRadialGauge(
              
              enableLoadingAnimation: true,
              axes: <RadialAxis>[
                RadialAxis(
                  showAxisLine: true,
                  showLabels: false,
                  showTicks: false,
                  radiusFactor: 0.8,
                  minimum: 0,
                  maximum: widget.datalimit == null ? 100 : widget.datalimit,
                  axisLineStyle: AxisLineStyle(
                      cornerStyle: CornerStyle.bothCurve,
                      color: Colors.grey.shade100,
                      thickness: 20
                  ),
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        angle: 90,
                        positionFactor: 0,
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                                displayRate.toStringAsFixed(2) + ' ' + unitText,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.systemGrey,
                                )),
                          ],
                        )),
                    GaugeAnnotation(
                        axisValue: displayRate,
                        angle: 124,
                        positionFactor: 1.1,
                        widget: Container(
                          child: Text('0', style: TextStyle(fontSize: 12)),
                        )),
                    GaugeAnnotation(
                        axisValue: displayRate,
                        angle: 54,
                        positionFactor: 1.1,
                        widget: Container(
                          child: Text("${widget.datalimit== null ? 100 : widget.datalimit}", style: TextStyle(fontSize: 14)),
                        )),
                  ],
                  pointers: [
                    RangePointer(
                      value: displayRate,
                      width: 29,
                      // pointerOffset: -6,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Colors.white,
                      gradient: SweepGradient(
                        startAngle: 20,
                        endAngle: 100,
                        tileMode: TileMode.clamp,
                        colors: [CupertinoColors.link, Colors.lightBlue],
                      ),
                    ),
                    // MarkerPointer(
                    //
                    //
                    //   markerType: MarkerType.text,
                    // )
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  color: CupertinoColors.link,
                  onPressed: () {
                    if (!isTesting) {
                      setState(() {
                        isTesting = true;
                      });
                      internetSpeedTest.startDownloadTesting(
                        onDone: (double transferRate, SpeedUnit unit) {
                          setState(() {
                            downloadRate = transferRate;
                            protectGauge(downloadRate);
                            unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                            downloadProgress = '100';
                            displayPer = 100.0;
                          });
                          internetSpeedTest.startUploadTesting(
                            onDone: (double transferRate, SpeedUnit unit) {
                              setState(() {
                                uploadRate = transferRate;
                                uploadRate = uploadRate * 10;
                                protectGauge(uploadRate);
                                unitText =
                                    unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                                uploadProgress = '100';
                                displayPer = 100.0;
                                isTesting = false;
                                // Display speed test results
                                Alert(
                                  context: context,
                                  style: alertStyle,
                                  type: AlertType.info,
                                  title: "TEST RESULTS",
                                  desc: 'Download Speed: ' +
                                      downloadRate.toStringAsFixed(2) +
                                      ' $unitText\nUpload Speed: ' +
                                      uploadRate.toStringAsFixed(2) +
                                      ' $unitText',
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      radius: BorderRadius.circular(0.0),
                                      color: CupertinoColors.systemBlue,
                                    ),
                                  ],
                                ).show();
                              });
                            },
                            onProgress: (double percent, double transferRate,
                                SpeedUnit unit) {
                              setState(() {
                                uploadRate = transferRate;
                                uploadRate = uploadRate * 10;
                                protectGauge(uploadRate);
                                unitText =
                                    unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                                uploadProgress = percent.toStringAsFixed(2);
                                displayPer = percent;
                              });
                            },
                            onError:
                                (String errorMessage, String speedTestError) {
                              showError(
                                  'Upload test failed! Please check your internet connection.');
                              setState(() {
                                isTesting = false;
                              });
                            },
                            testServer: uploadServer,
                            fileSize: 20000000,
                          );
                        },
                        onProgress: (double percent, double transferRate,
                            SpeedUnit unit) {
                          setState(() {
                            downloadRate = transferRate;
                            protectGauge(downloadRate);
                            unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                            downloadProgress = percent.toStringAsFixed(2);
                            displayPer = percent;
                          });
                        },
                        onError: (String errorMessage, String speedTestError) {
                          showError(
                              'Download test failed! Please check your internet connection.');
                          setState(() {
                            isTesting = false;
                          });
                        },
                        testServer: downloadServer,
                        fileSize: 20000000,
                      );
                    }
                  },
                  child: Text("Check Speed"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CupertinoColors.systemBlue),
                        elevation: MaterialStateProperty.all(0)),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text("Exit"))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160.0),
              child: Text("This App is Copyright © 2021 Yash school of technology",style: TextStyle(
                  color: CupertinoColors.systemGrey2,
                  fontSize: 12
              ),),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
