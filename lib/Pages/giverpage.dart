import 'package:flutter/material.dart';

class GiverPage extends StatefulWidget {
  const GiverPage({super.key});

  @override
  State<GiverPage> createState() => _GiverPageState();
}

class _GiverPageState extends State<GiverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('GiverPage')
      ),
      //PLEASE FEEL FREE TO CHANGE THE BODY i put this as a placeholder
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Hello from GiverPage")
            ],
          ),
        ),
      ),
    );
  }
}
