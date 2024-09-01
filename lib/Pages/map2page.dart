import 'package:flutter/material.dart';

class Map2Page extends StatefulWidget {
  @override
  _Map2PageState createState() => _Map2PageState();
}

class _Map2PageState extends State<Map2Page> {
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
                      onPressed: () {},
                      child: Text(
                        "Order 1",
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
                      onPressed: () {},
                      child: Text(
                        "Order 2",
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
