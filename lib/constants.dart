
  import 'package:flutter/material.dart';

import 'models/timeChoice.dart';



  final List<String> roundsDropDownList = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  
  final List<TimeChoice> workDropDownList = [
    TimeChoice(choice: "5 seconds", time: const Duration(seconds: 5)),
    TimeChoice(choice: "6 seconds", time: const Duration(seconds: 6)),
    TimeChoice(choice: "7 seconds", time: const Duration(seconds: 7)),
    TimeChoice(choice: "8 seconds", time: const Duration(seconds: 8)),
    TimeChoice(choice: "9 seconds", time: const Duration(seconds: 9)),
    TimeChoice(choice: "10 seconds", time: const Duration(seconds: 10)),
  ];

  final List<TimeChoice> restDropDownList = [
    TimeChoice(choice: "0 seconds", time: const Duration(seconds: 0)),
    TimeChoice(choice: "1 seconds", time: const Duration(seconds: 1)),
    TimeChoice(choice: "2 seconds", time: const Duration(seconds: 2)),
    TimeChoice(choice: "3 seconds", time: const Duration(seconds: 3)),
    TimeChoice(choice: "4 seconds", time: const Duration(seconds: 4)),
    TimeChoice(choice: "5 seconds", time: const Duration(seconds: 5)),
  ];

  const kNormalTextStyle = TextStyle(color: Colors.white, fontSize: 20);
  const kSmallTextStyle = TextStyle(color: Colors.white, fontSize: 15);
  const kMediumTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  const kLargeTextStyle = TextStyle(color: Colors.white, fontSize: 36);
