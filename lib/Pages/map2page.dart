import 'package:flutter/material.dart';

class Map2Page extends StatefulWidget {
  @override
  _Map2PageState createState() => _Map2PageState();
}

class _Map2PageState extends State<Map2Page> {
  Future<String?> _showPopupDialog(BuildContext context, String summaryText) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: Text(
            summaryText,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close dialog without returning data
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(summaryText); // Return summaryText
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
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
                const SizedBox(height: 25),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await _showPopupDialog(context,
                          "Order 1\nPack 2\n 12/1/2024\n12.00 PM\nFrom: Oracle \nTo: Jalan Kukoh RC");
                      if (result != null) {
                        Navigator.pop(context,
                            result); // Return the result to previous page
                      }
                    },
                    child: const Text(
                      "Order 1",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await _showPopupDialog(context,
                          "Order 1\nPack 2\n 12/1/2024\n12.00 PM\nFrom: Jlan Kukoh RC \nTo: Block 241");
                      if (result != null) {
                        Navigator.pop(context,
                            result); // Return the result to previous page
                      }
                    },
                    child: const Text(
                      "Order 2",
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
                      Navigator.pop(
                          context); // Close the page without returning data
                    },
                    child: const Text(
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
