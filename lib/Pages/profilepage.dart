import 'package:flutter/material.dart';
import 'package:youth_hack_2k24_group14/services/firestore.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final TextEditingController _nameController = TextEditingController();
String _name = '';

class _ProfilePageState extends State<ProfilePage> {

  final FirestoreService firestoreService = FirestoreService();
  String _radioItem = "";

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 100),
                TextField(
                  controller: _nameController,
                  onChanged: (text) {
                    setState(() {
                      _name = text;
                    });
                  },
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    hintText: 'Enter Here',
                    hintStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
                const SizedBox(height: 25),
                RadioListTile<String>(
                  title: const Text("Secondary Student"),
                  value: "Secondary Student",
                  groupValue: _radioItem,
                  onChanged: (value) {
                    setState(() {
                      _radioItem = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text("Tertiary Student"),
                  value: "Tertiary Student",
                  groupValue: _radioItem,
                  onChanged: (value) {
                    setState(() {
                      _radioItem = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text("Volunteer from partners"),
                  value: "Volunteer from partners",
                  groupValue: _radioItem,
                  onChanged: (value) {
                    setState(() {
                      _radioItem = value!;
                    });
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_name.isEmpty || _radioItem.isEmpty) {
                        _showSnackbar(
                            context, 'Please enter name and select a role');
                      } else {
                        firestoreService.addDeliverer(
                            _name,
                            _radioItem,
                        );
                        final result = '$_name - $_radioItem';
                        Navigator.pop(context, result);
                      }
                    },
                    child: Text(
                      "Submit",
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
                          context); // Pops without returning any value
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
//end