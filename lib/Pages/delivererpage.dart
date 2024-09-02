import 'package:flutter/material.dart';

import 'map2page.dart';
import 'profilepage.dart';

class DelivererPage extends StatefulWidget {
  final String initialName;

  DelivererPage({super.key, this.initialName = ""});

  @override
  State<DelivererPage> createState() => _DelivererPageState();
}

class _DelivererPageState extends State<DelivererPage> {
  late String _name;

  @override
  void initState() {
    super.initState();
    _name = widget.initialName;
  }

  Future<void> _navigateToProfilePage(BuildContext context) async {
    final newName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );

    if (newName != null) {
      setState(() {
        _name = newName; // Update the _name with the returned data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text(
                  "Welcome, $_name",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 25),
                // Conditionally render the Profile button
                if (_name.isEmpty)
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _navigateToProfilePage(context);
                      },
                      child: Text(
                        "Profile",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Map2Page(),
                        ),
                      );
                    },
                    child: Text(
                      "Choice",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
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
