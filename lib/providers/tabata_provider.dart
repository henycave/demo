import 'package:demo/constants.dart';
import 'package:flutter/material.dart';

class TabataProvider extends ChangeNotifier {
  String _rounds = roundsDropDownList.first;
  Duration _work = workDropDownList.first.time;
  Duration _rest = restDropDownList.first.time;
  Duration _current = const Duration(seconds: 10);
  int _currentPercentSeconds = 10;
  int _roundCounter = 1;

  bool _isRunning = false;
  bool _isPaused = false;
  bool _isComplete = false;
  bool _onRest = false;
  bool _onIntro = true;

  String get rounds => _rounds;

  Duration get work => _work;

  Duration get rest => _rest;

  Duration get current => _current;

  int get currentPercentSeconds => _currentPercentSeconds;

  int get roundCounter => _roundCounter;

  bool get isRunning => _isRunning;

  bool get isPaused => _isPaused;

  bool get isComplete => _isComplete;

  bool get onRest => _onRest;

  bool get onIntro => _onIntro;

  set rounds(String value) {
    _rounds = value;
    notifyListeners();
  }

  set work(Duration value) {
    _work = value;
    notifyListeners();
  }

  set rest(Duration value) {
    _rest = value;
    notifyListeners();
  }

  set current(Duration value) {
    _current = value;
    notifyListeners();
  }

  set currentPercentSeconds(int value) {
    _currentPercentSeconds = value;
    notifyListeners();
  }

  set roundCounter(int value) {
    _roundCounter = value;
    notifyListeners();
  }

  set isRunning(bool value) {
    _isRunning = value;
    notifyListeners();
  }

  set isPaused(bool value) {
    _isPaused = value;
    notifyListeners();
  }

  set isComplete(bool value) {
    _isComplete = value;
    notifyListeners();
  }

  set onRest(bool value) {
    _onRest = value;
    notifyListeners();
  }

  set onIntro(bool value) {
    _onIntro = value;
    notifyListeners();
  }

  void resetFromState() {
    current = const Duration(seconds: 10);
    currentPercentSeconds = 10;
    isRunning = false;
    isPaused = false;
    isComplete = false;
    roundCounter = 1;
    onRest = false;
    onIntro = true;
  }
}
