import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:youth_hack_2k24_group14/Pages/chooserolepage.dart';
import 'package:youth_hack_2k24_group14/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChooseRolePage(),
    );
  }
}

