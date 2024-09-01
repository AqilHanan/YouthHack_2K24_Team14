import 'package:flutter/material.dart';

import 'mappage.dart';

class ChoicePage extends StatefulWidget {
  ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                // spacing to make things look nice
                const SizedBox(
                  height: 100,
                ),
                //put title or smth looks plain rn

                //Elevated Button for Delivery
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MapPage()));
                      },
                      child: Text(
                        "MAP",
                        style: TextStyle(fontSize: 24),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),

                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Exit",
                        style: TextStyle(fontSize: 24),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
