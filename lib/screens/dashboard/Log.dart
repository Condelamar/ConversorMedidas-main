import 'package:flutter/material.dart';
import 'package:hello_world/controllers/SalvaLogController.dart';
import 'package:hello_world/models/SalvaLog.dart';
import 'package:hello_world/screens/dashboard/Conversor.dart';
import 'package:provider/provider.dart';

class Log extends StatelessWidget {
  int _selectedIndex = 0;
  String logString = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Conversor de medidas',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Log de conversões",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              backgroundColor: Color.fromARGB(255, 85, 49, 248),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.playlist_remove),
                  label: 'Limpar Log',
                ),
              ],
              currentIndex: 0,
              selectedItemColor: Color.fromARGB(255, 85, 49, 248),
              onTap: (int index) {
                switch (index) {
                  case 0:
                    if (_selectedIndex == index) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Conversor()));
                    }
                    break;
                  case 1:
                    // você está tentando invocar um m[etodo do seu modelo para limpar os logs
                    // lembra modelos != controller. Quem deve gerenciar seu estado sempre deve ser um provider (controller)
                    // podemos discutir mais sobre sua duvida na proxima aula
                    print('aqui será');
                    Provider.of<SalvaLogController>(context, listen: false)
                        .limpaLog();
                    // SalvaLog.limpaLog();
                    break;
                }
                _selectedIndex = index;
              },
            ),
            body: Consumer<SalvaLogController>(builder: (context, log, child) {
              return SingleChildScrollView(
                child: Column(
                  children:
                      log.getSalvaLog.valoresLog!.map((calculo) {
                    return Card(
                        child: Column(
                      children: [Text(calculo.toString())],
                    ));
                  }).toList(),
                ),
              );
            })));
  }
}
