import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
