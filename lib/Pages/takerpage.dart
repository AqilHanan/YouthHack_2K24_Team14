import 'package:flutter/material.dart';

class TakerPage extends StatefulWidget {
  const TakerPage({super.key});

  @override
  State<TakerPage> createState() => _TakerPageState();
}

class _TakerPageState extends State<TakerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('TakerPage')
      ),
      //PLEASE FEEL FREE TO CHANGE THE BODY i put this as a placeholder
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Hello from TakerPage")
            ],
          ),
        ),
      ),
    );
  }
}
