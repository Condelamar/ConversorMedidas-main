import 'package:flutter/cupertino.dart';
import 'package:hello_world/models/SalvaLog.dart';

class SalvaLogController extends ChangeNotifier {
  SalvaLog _salvaLog = new SalvaLog();

  SalvaLog get getSalvaLog => _salvaLog;

  void renew() {
    _salvaLog = new SalvaLog();
    notifyListeners();
  }

  void set valoresLog(List<String>? valoresLog) {
    _salvaLog.valoresLog!.addAll(valoresLog!);
    notifyListeners();
  }

  void set logString(String? logString){
    _salvaLog.logString = logString;
  }

   String? listaLog() {
    for (int i = 0; i < _salvaLog.valoresLog!.length; i++) {
    logString = logString! + _salvaLog.valoresLog![i] + '\n';
    }
    return logString;
    
  }

  List<String>? get salvaLog => _salvaLog.valoresLog;
  String? get logString => _salvaLog.logString;

  // seu provider precisa prover um mecanismo de expor a função de limpeza de log do seu modelo
  void limpaLog(){    
    _salvaLog.limpaLog();
    notifyListeners();
  }
}
