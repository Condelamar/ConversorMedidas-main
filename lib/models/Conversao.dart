import 'package:flutter/material.dart';

class Conversao {
  double? _valorConvertido = 0;
  double? _valorPassado = 0;
  String? _dropDownValue = 'Milhas';
  String? _dropDownValue2 = 'Quilômetros';


  Conversao() {}

  double? get valorConvertido => _valorConvertido;
  double? get valorPassado => _valorPassado;
  String? get dropDownValue => _dropDownValue;
  String? get dropDownValue2 => _dropDownValue2;

  void set valorConvertido(double? valor) {
    _valorConvertido = valor;
  }

  void set valorPassado(double? valor) {
    _valorPassado = valor;
  }

  void set dropDownValue(String? valor){
    _dropDownValue = valor;
  }

  void set dropDownValue2(String? valor){
    _dropDownValue2 = valor;
  }

  double converteMilhaKm() {
    return _valorConvertido = _valorPassado! * 1.609;
  }

  double converteMilhaCm() {
    return _valorConvertido = _valorPassado! * 0.0000062137;
  }

  double converteJardaKm() {
    return _valorConvertido = _valorPassado! * 1093.6;
  }

  double converteJardaCm() {
    return _valorConvertido = _valorPassado! * 0.010936;
  }

  @override
  String toString() {
    return _valorConvertido.toString();
  }
}
