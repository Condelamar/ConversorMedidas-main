import 'package:flutter/material.dart';
import 'package:hello_world/controllers/ConversaoController.dart';
import 'package:hello_world/controllers/SalvaLogController.dart';
import 'package:hello_world/screens/dashboard/Conversor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ConversaoController()),
      ChangeNotifierProvider(create: (context) => SalvaLogController())
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 85, 49, 248),
      ),
      home: Conversor(),
    );
  }
}
