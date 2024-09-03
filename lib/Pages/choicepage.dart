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
      backgroundColor: Colors.greenAccent[200], // Match background color with ChooseRolePage
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            children: [
              // Elevated Button for Map
              SizedBox(
                height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen[200], // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.amber[100]!, width: 10), // Amber ring
                    ),
                    elevation: 10,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                  child: Text(
                    "MAP",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black, // Text color for contrast
                    ),
                  ),
                ),
              ),

              // Spacing between buttons
              const SizedBox(height: 25),

              // Elevated Button for Exit
              SizedBox(
                height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen[200], // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.amber[100]!, width: 10), // Amber ring
                    ),
                    elevation: 10,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Exit",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black, // Text color for contrast
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
