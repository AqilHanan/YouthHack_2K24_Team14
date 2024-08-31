import 'package:flutter/material.dart';
import 'package:youth_hack_2k24_group14/Pages/takerpage.dart';
import 'giverpage.dart';
import 'takerpage.dart';
import 'delivererpage.dart';

class ChooseRolePage extends StatefulWidget {
   ChooseRolePage({super.key});

  @override
  State<ChooseRolePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
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
                //put title or smth looks plain rn

                //Notifications Bar with shadow (elevbutton as placeholder WILL CHANGE)

                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(onPressed:(){},
                      child: Text("Placeholder for notif",style: TextStyle(fontSize: 24),)
                  ),
                ),

                //Elevated Button for Giver
                const SizedBox(height: 25,),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(onPressed:(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GiverPage())
                    );
                  },
                      child: Text("Giver",style: TextStyle(fontSize: 24),)
                  ),
                ),

                //Elevated Button for Taker
                const SizedBox(height: 25,),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(onPressed:(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TakerPage())
                    );
                  },
                      child: Text("Taker",style: TextStyle(fontSize: 24),)
                  ),
                ),

                //Elevated Button for Delivery
                const SizedBox(height: 25,),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(onPressed:(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DelivererPage())
                    );
                  },
                      child: Text("Delivery",style: TextStyle(fontSize: 24),)
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
