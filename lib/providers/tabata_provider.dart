import 'package:demo/constants.dart';
import 'package:flutter/material.dart';

class TabataProvider extends ChangeNotifier{
  String _rounds = "3";
  Duration _work = workDropDownList.first.time;
  Duration _rest = restDropDownList.first.time;


  String get rounds => _rounds;
  Duration get work => _work;
  Duration get rest => _rest;



  set rounds(String value){
    _rounds = value;
    notifyListeners();
  }

  set work(Duration value){
    _work = value;
    notifyListeners();
  }

  set rest(Duration value){
    _rest = value;
    notifyListeners();
  }

}