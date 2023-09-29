// import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class TabataTimerPage extends StatefulWidget {
  const TabataTimerPage({Key? key}) : super(key: key);

  @override
  _TabataTimerPageState createState() => _TabataTimerPageState();
}

class _TabataTimerPageState extends State<TabataTimerPage> {
  Duration seconds = const Duration(minutes: 2);
  bool isRunning = false;
  bool isPaused = false;
  Timer? _timer;

  void startTimer() {
    //seconds = DateFormat('hh:mm:ss').format(seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!seconds.isNegative) {
        setState(() {
          seconds = Duration(seconds: seconds.inSeconds - 1);
          //seconds--;
        });
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "TABATA",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.save_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "1/1 - Work",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/progress.png",
                      width: 380,
                      height: 370,
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width * 0.97,
                      top: MediaQuery.of(context).size.width * 0.02,
                      child: CircularPercentIndicator(
                        backgroundColor: Colors.transparent,
                        radius: 172.0,
                        lineWidth: 18.0,
                        percent: 1 - (seconds.inSeconds / 120),
                        //center: const Text("100%"),
                        progressColor: Colors.green,
                      ),
                    ),
                    Positioned(
                        width: MediaQuery.of(context).size.width * 0.97,
                        top: MediaQuery.of(context).size.width * 0.17,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.6,
                          child: !isRunning
                              ? Column(
                                  children: !isPaused
                                      ? [
                                          MaterialButton(
                                            onPressed: () {
                                              startTimer();
                                              setState(() {
                                                isRunning = _timer == null
                                                    ? false
                                                    : _timer!.isActive;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.play_arrow,
                                              color: Colors.green,
                                              size: 180,
                                            ),
                                          ),
                                          const Text(
                                            "tap to start",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ]
                                      : [
                                          MaterialButton(
                                            onPressed: () {
                                              startTimer();
                                              setState(() {
                                                isRunning = _timer == null
                                                    ? false
                                                    : _timer!.isActive;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.pause,
                                              color: Colors.green,
                                              size: 180,
                                            ),
                                          ),
                                          const Text(
                                            "tap to resume",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                )
                              : MaterialButton(
                                  onPressed: () {
                                    stopTimer();
                                    setState(() {
                                      isPaused = true;
                                      isRunning = false;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${seconds.inMinutes.remainder(60).toString().padLeft(2, '0')} :${seconds.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 80),
                                      ),
                                      const Text(
                                        "tap to pause",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                        ))
                  ],
                ),
                // CircularSeekBar(
                //   width: double.infinity,
                //   height: 300,
                //   progress: 0,
                //   barWidth: 8,
                //   startAngle: 90,
                //   sweepAngle: 360,
                //   strokeCap: StrokeCap.butt,
                //   progressColor: Colors.blue,
                //   innerThumbStrokeWidth: 3,
                //   //progressGradientColors: [Colors.blue, Colors.indigo, Colors.purple],
                //   dashWidth: 1,
                //   dashGap: 4,
                //   animation: true,
                // )
              ],
            ),
          ),
        ));
  }
}
