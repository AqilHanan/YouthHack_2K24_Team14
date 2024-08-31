import 'package:flutter/material.dart';

class DelivererPage extends StatefulWidget {
  const DelivererPage({super.key});

  @override
  State<DelivererPage> createState() => _DelivererPageState();
}

class _DelivererPageState extends State<DelivererPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliverPage')
      ),
      //PLEASE FEEL FREE TO CHANGE THE BODY i put this as a placeholder
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Hello from DelivererPage")
            ],
          ),
        ),
      ),
    );
  }
}