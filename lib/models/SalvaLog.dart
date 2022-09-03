import 'package:flutter/material.dart';

class SalvaLog {
   static List<String>? _valoresLog = [];
   static String? _logString = '';

  SalvaLog() {}

   List<String>? get valoresLog => _valoresLog;
   String? get logString => _logString;

  static void setValoreslog(String value) {
    _valoresLog!.add(value);
  }

  void set valoresLog(List<String>? valoresLog){
    _valoresLog!.addAll(valoresLog!);
  }

  void set logString(String? logString) {
    _logString = logString;
  }

    static void limpaLog (){
    _valoresLog!.clear();
  }
}
