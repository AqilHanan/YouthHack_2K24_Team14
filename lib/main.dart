import 'package:flutter/material.dart';
import 'package:youth_hack_2k24_group14/Pages/chooserolepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChooseRolePage(),
    );
  }
}

