
  import 'models/timeChoice.dart';



  // final List<String> workDropDownList = [
  //   "5 seconds",
  //   "6 seconds",
  //   "7 seconds",
  //   "8 seconds",
  //   "9 seconds",
  //   "10 seconds",
  //   "11 seconds",
  //   "12 seconds",
  //   "13 seconds",
  //   "14 seconds",
  // ];

  // final List<String> restDropDownList = [
  //   "0 seconds",
  //   "1 seconds",
  //   "2 seconds",
  //   "3 seconds",
  //   "4 seconds",
  //   "10 seconds",
  //   "11 seconds",
  //   "12 seconds",
  //   "13 seconds",
  //   "14 seconds",
  // ];
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
