import 'package:flutter/material.dart';

import 'collectionpage.dart';

class TakerPage extends StatefulWidget {
  TakerPage({super.key});

  @override
  State<TakerPage> createState() => _TakerPageState();
}

class _TakerPageState extends State<TakerPage> {
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
                                builder: (context) => CollectionPage()));
                      },
                      child: Text(
                        "Delivery",
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
                                builder: (context) => CollectionPage()));
                      },
                      child: Text(
                        "Delivery",
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
