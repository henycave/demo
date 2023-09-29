// import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'dart:async';
import 'dart:collection';
import 'package:demo/ui/tabata/widgets/timerWidget.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../../constants.dart';
import '../../providers/tabata_provider.dart';
// import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class TabataTimerPage extends StatefulWidget {
  const TabataTimerPage({Key? key}) : super(key: key);

  @override
  _TabataTimerPageState createState() => _TabataTimerPageState();
}

class _TabataTimerPageState extends State<TabataTimerPage> {
  late Duration rest;
  late Duration work;
  late int rounds;
  Timer? _timer;
  var timerQueue = Queue<Duration>();

  void startSet() {
    timerQueue.add(const Duration(seconds: 10));
    for (var i = 0; i < rounds; i++) {
      timerQueue.add(work);
      if (rest.inSeconds != 0) {
        timerQueue.add(const Duration(days: 1));
        timerQueue.add(rest);
      }
      if (rounds - 1 != i) {
        timerQueue.add(const Duration());
      }
    }
    startNextTimer();
  }

  void startNextTimer({bool isOnResume = false}) async {
    if (timerQueue.isEmpty) {
      Provider.of<TabataProvider>(context, listen: false).isComplete = true;
      return;
    }
    var duration = timerQueue.removeFirst();
    if (duration.inSeconds == 0) {
      Provider.of<TabataProvider>(context, listen: false).roundCounter++;
      Provider.of<TabataProvider>(context, listen: false).onRest = false;
      startNextTimer();
    } else if (duration.inDays == 1) {
      Provider.of<TabataProvider>(context, listen: false).onRest = true;
      startNextTimer();
    } else {
      if (!isOnResume) {
        Provider.of<TabataProvider>(context, listen: false)
            .currentPercentSeconds = duration.inSeconds;
      }

      _timer = Timer.periodic(const Duration(seconds: 1), (timer){
        if (duration.inSeconds > 0) {
          duration = Duration(seconds: duration.inSeconds - 1);
          Provider.of<TabataProvider>(context, listen: false).current =
              duration;
        } else {
          stopTimer();
        }
        if (_timer == null) {
          Provider.of<TabataProvider>(context, listen: false).onIntro = false;
          startNextTimer();
        }
      });
    }
  }

  void stopTimer() {
    _timer!.cancel();
    _timer = null;
  }

  @override
  void initState() {
    work = Provider.of<TabataProvider>(context, listen: false).work;
    rest = Provider.of<TabataProvider>(context, listen: false).rest;
    rounds = int.tryParse(
        Provider.of<TabataProvider>(context, listen: false).rounds)!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabataProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "TABATA",
            style: kNormalTextStyle,
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
                Text(
                  !provider.onRest
                      ? "${provider.roundCounter}/$rounds Work"
                      : !provider.isComplete
                          ? "${provider.roundCounter}/$rounds Rest"
                          : "${provider.roundCounter}/$rounds Rounds",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                !provider.isComplete
                    ? TimerWidget(
                        percentSeconds: provider.currentPercentSeconds,
                        onStart: () {
                          startSet();
                          provider.isRunning =
                              _timer == null ? false : _timer!.isActive;
                        },
                        onPause: () {
                          stopTimer();
                          provider.isPaused = true;
                          provider.isRunning = false;
                        },
                        onResume: () {
                          timerQueue.addFirst(provider.current);
                          startNextTimer(isOnResume: true);
                          provider.isRunning =
                              _timer == null ? false : _timer!.isActive;
                        })
                    : const Expanded(
                        child: RiveAnimation.asset(
                        "assets/checkmark_icon.riv",
                        fit: BoxFit.scaleDown,
                      ))
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
