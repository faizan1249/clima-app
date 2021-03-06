import 'package:flutter/material.dart';
import 'package:clima_app/screens/loading_screen.dart';
import 'package:clima_app/screens/city_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clima App",
      routes: {
        '/city': (context) =>  CityScreen(),

      },
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
