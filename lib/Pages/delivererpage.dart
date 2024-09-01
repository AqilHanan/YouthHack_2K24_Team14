import 'package:flutter/material.dart';

import 'map2page.dart';
import 'profilepage.dart';

class DelivererPage extends StatefulWidget {
  const DelivererPage({super.key});

  @override
  State<DelivererPage> createState() => _DelivererPageState();
}

class _DelivererPageState extends State<DelivererPage> {
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: Text(
                        "Profile",
                        style: TextStyle(fontSize: 24),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Map2Page()));
                      },
                      child: Text(
                        "Choice",
                        style: TextStyle(fontSize: 24),
                      )),
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
