import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'delivererpage.dart';
import 'giverpage.dart';
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
      //backgroundColor: Colors.greenAccent[200], //200 //400
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
                      backgroundColor: Colors.greenAccent[200],
                      shadowColor: Colors.black,
                      elevation: 6
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestGiverPage()));
                    },
                    child: Text("Giver", style: TextStyle(fontSize: 24)),
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
                        backgroundColor: Colors.greenAccent[200],
                        shadowColor: Colors.black,
                        elevation: 6
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
                    child: Text("Taker", style: TextStyle(fontSize: 24)),
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
                        backgroundColor: Colors.greenAccent[200],
                        shadowColor: Colors.black,
                        elevation: 6
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
                        Text("Delivery", style: TextStyle(fontSize: 24)),
                        SizedBox(width: 8,),
                        Icon(Icons.front_hand_outlined),
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
