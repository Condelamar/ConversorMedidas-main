import 'package:flutter/cupertino.dart';
import 'package:hello_world/models/Conversao.dart';

class ConversaoController extends ChangeNotifier {
  Conversao _conversao = new Conversao();

  Conversao get getConversao => _conversao;

  void renew() {
    _conversao = new Conversao();
    notifyListeners();
  }

  void valorConvertido2(double? valorConvertido) {
    _conversao.valorConvertido = valorConvertido;
    notifyListeners();
  }

  void set valorPassado(double? valorPassado) {
    _conversao.valorPassado = valorPassado;
    notifyListeners();
  }

  void set valorConvertido(double? valorConvertido) {
    _conversao.valorConvertido = valorConvertido;
    notifyListeners();
  }

  void set dropDownValue(String? newValue) {
    _conversao.dropDownValue = newValue;
    notifyListeners();
  }

  void set dropDownValue2(String? newValue) {
    _conversao.dropDownValue2 = newValue;
    notifyListeners();
  }

  double? get valorConvertido => _conversao.valorConvertido;
  double? get valorPassado => _conversao.valorPassado;
  String? get dropDownValue => _conversao.dropDownValue;
  String? get dropDownValue2 => _conversao.dropDownValue2;
}
