import 'package:flutter/material.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                // spacing to make things look nice
                const SizedBox(height: 100,),
                
                //Notifications Bar with shadow

                //Elevated Button for Giver
                ElevatedButton(onPressed:(){} , child: Text("Giver")),

                //Elevated Button for Taker
                ElevatedButton(onPressed:(){} , child: Text("Giver")),

                //Elevated Button for Delivery
                ElevatedButton(onPressed:(){} , child: Text("Giver")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
