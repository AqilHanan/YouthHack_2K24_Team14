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
  String _summaryText = '';

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
        _name = newName;
      });
    }
  }

  Future<void> _navigateToMap2Page(BuildContext context) async {
    final summaryText = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Map2Page(),
      ),
    );

    if (summaryText != null) {
      setState(() {
        _summaryText = summaryText;
      });
    }
  }

  void _clearSummaryText() {
    setState(() {
      _summaryText = ''; // Clear the summary text
    });
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
                // Conditionally display summary text and buttons
                if (_summaryText.isNotEmpty) ...[
                  Text(
                    "Summary: $_summaryText",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _clearSummaryText();
                      },
                      child: Text(
                        "Finished",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ] else ...[
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
                        _navigateToMap2Page(context);
                      },
                      child: Text(
                        "Choice",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 25),
                if (_summaryText.isEmpty)
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
