import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/playing_area.dart';
import 'package:tic_tac_toe/screens/options_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tic Tac Toe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: OptionsScreen()
    );
  }
}

