import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'delivererpage.dart';
import 'takerpage.dart';
import 'testgiverpage.dart';

class ChooseRolePage extends StatefulWidget {
  ChooseRolePage({super.key});

  @override
  State<ChooseRolePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background remains the same color
      backgroundColor: Colors.greenAccent[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen[200], // Set button color to white
                      side: BorderSide(color: Colors.amber[100]!, width: 10), // Amber outer ring
                      shadowColor: Colors.black,
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestGiverPage()));
                    },
                    child: Row(
                      children: [
                        Text("Giver", style: TextStyle(fontSize: 24,color: Colors.black)),
                        SizedBox(width: 50),
                        Icon(CupertinoIcons.heart_circle,size: 35),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen[200], // Set button color to white
                      side: BorderSide(color: Colors.amber[100]!, width: 10), // Amber outer ring
                      shadowColor: Colors.black,
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TakerPage(
                            initialTier: "Tier 0", // Pass initial tier here
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text("Taker", style: TextStyle(fontSize: 24,color: Colors.black)),
                        SizedBox(width: 45),
                        Icon(Icons.handshake_outlined,size: 35,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen[200], // Set button color to white
                      side: BorderSide(color: Colors.amber[100]!, width: 10), // Amber outer ring
                      shadowColor: Colors.black,
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DelivererPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text("Delivery", style: TextStyle(fontSize: 24,color: Colors.black)),
                        SizedBox(width: 25),
                        Icon(Icons.motorcycle_sharp,size: 35),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//end