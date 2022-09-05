import 'package:flutter/material.dart';

class SalvaLog {

  // porque sua classe SalvaLog armazena uma lista de Strings e não uma lista de objetos Conversão?
  // seria mais interessante, agregaria mais inforações no seu log

  static List<String>? _valoresLog = [];
  static String? _logString = '';

  SalvaLog() {}

  List<String>? get valoresLog => _valoresLog;
  String? get logString => _logString;

  static void setValoreslog(String value) {
    _valoresLog!.add(value);
  }

  void set valoresLog(List<String>? valoresLog) {
    _valoresLog!.addAll(valoresLog!);
  }

  void set logString(String? logString) {
    _logString = logString;
  }

  void limpaLog() {
    _valoresLog!.clear();
  }
}
