import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../providers/tabata_provider.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget(
      {Key? key,
      required this.percentSeconds,
      required this.onStart,
      required this.onPause,
      required this.onResume})
      : super(key: key);

  final int percentSeconds;
  final Function onStart;
  final Function onResume;
  final Function onPause;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabataProvider>(context);

    return Stack(
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
            percent: 1 - (provider.current.inSeconds / widget.percentSeconds),
            //center: const Text("100%"),
            progressColor: Colors.green,
          ),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width * 0.97,
            top: MediaQuery.of(context).size.width * 0.17,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.6,
              child: !provider.isRunning
                  ? Column(
                      children: !provider.isPaused
                          ? [
                              MaterialButton(
                                onPressed: (){widget.onStart();},
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.green,
                                  size: 180,
                                ),
                              ),
                              const Text(
                                "tap to start",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ]
                          : [
                              MaterialButton(
                                onPressed: (){widget.onResume();},
                                child: const Icon(
                                  Icons.pause,
                                  color: Colors.green,
                                  size: 180,
                                ),
                              ),
                              const Text(
                                "tap to resume",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                    )
                  : MaterialButton(
                      onPressed: () => widget.onPause(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${provider.current.inMinutes.remainder(60).toString().padLeft(2, '0')} :${provider.current.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 80),
                          ),
                          const Text(
                            "tap to pause",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
            ))
      ],
    );
  }
}
