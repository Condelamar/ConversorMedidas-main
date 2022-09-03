import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hello_world/controllers/ConversaoController.dart';
import 'package:hello_world/models/Conversao.dart';
import 'package:hello_world/models/SalvaLog.dart';
import 'package:hello_world/screens/dashboard/Log.dart';
import 'package:provider/provider.dart';

class Conversor extends StatelessWidget {
  @override
  String dropdownValue = 'Milhas';
  String dropdownValue2 = 'Quilômetros';
  double top = 0.0;
  double valorConversao = 0;

  List<String> imperiais = ["Milhas", "Jardas"];

  Conversao C = new Conversao();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Conversor de Medidas",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Conversor de Medidas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              backgroundColor: Color.fromARGB(255, 85, 49, 248),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'Log',
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Log()));
                },
              ),
            ),
            body: Consumer<ConversaoController>(
                builder: (context, conversao, child) {
              return Column(
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Valor"),
                    onSubmitted: (String value) {
                      conversao.valorPassado = double.parse(value);
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        "Converter de",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 400,
                        child: Container(
                          color: Colors.white,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: conversao.dropDownValue,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onChanged: (String? newValue) {
                              conversao.dropDownValue = newValue!;
                            },
                            items: <String>['Milhas', 'Jardas']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Text(
                        "Para",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 400,
                        child: Container(
                          color: Colors.white,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: conversao.dropDownValue2,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onChanged: (String? newValue) {
                              conversao.dropDownValue2 = newValue!;
                            },
                            items: <String>['Quilômetros', 'Centímetros']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 85, 49, 248),
                              elevation: 15,
                              shadowColor: Colors.green),
                          child: Text(
                            'Converter',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            if (dropdownValue2.contains('Quilômetros') &&
                                dropdownValue.contains('Milhas')) {
                              valorConversao = conversao.getConversao.converteMilhaKm();
                              conversao.valorConvertido = valorConversao;
                              SalvaLog.setValoreslog(valorConversao.toString());
                            } else if (dropdownValue2.contains('Quilômetros') &&
                                dropdownValue.contains('Jardas')) {
                              valorConversao = conversao.getConversao.converteJardaKm();
                              
                              conversao.valorConvertido = valorConversao;
                            } else if (dropdownValue2.contains('Centímetros') &&
                                dropdownValue.contains('Milhas')) {
                              valorConversao = conversao.getConversao.converteMilhaCm();
                              
                              conversao.valorConvertido = valorConversao;
                            } else if (dropdownValue2.contains('Centímetros') &&
                                dropdownValue.contains('Jardas')) {
                              valorConversao = conversao.getConversao.converteJardaCm();
                              
                              conversao.valorConvertido = valorConversao;
                            }
                          },
                        ),
                      ),
                      Text(
                        "Valor convertido: " +
                             conversao.getConversao.valorConvertido.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              );
            })));
  }
}
