import 'package:flutter/material.dart';
import 'package:youth_hack_2k24_group14/services/firestore.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

enum PlanType { longTerm, shortTerm }

class _CollectionPageState extends State<CollectionPage> {
  final FirestoreService firestoreService = FirestoreService();

  final List<String> _facilities = [
    'Halal',
    'Vegan',
    'Vegetarian',
    'Kosher',
    'Allergens (fill up the box)',
  ];
  final List<bool> _selectedFacilities = [
    false,
    false,
    false,
    false,
    false,
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _familyMembersController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  PlanType? _selectedPlan = PlanType.longTerm; // Default selected plan

  String _selectedFacilitiesString = '';
  String _name = '';
  String _familyMembers = '';
  String _income = '';
  String selectedPlan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[200], // Background color to match the other pages
      appBar: AppBar(
        title: const Text('TakerPage'),
        backgroundColor: Colors.lightGreen[200], // AppBar background color
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Name'),
              _buildTextField(_nameController, 'Enter Here', (text) {
                setState(() {
                  _name = text;
                });
              }),
              _buildSectionTitle('Plan Type'),
              _buildRadioListTile(PlanType.longTerm, 'Long Term'),
              _buildRadioListTile(PlanType.shortTerm, 'Short Term'),
              _buildSectionTitle('How Many Family Members do you have?'),
              _buildTextField(_familyMembersController, 'Enter Here', (text) {
                setState(() {
                  _familyMembers = text;
                });
              }),
              _buildSectionTitle('What is your total monthly household income'),
              _buildTextField(_incomeController, 'Enter Here', (text) {
                setState(() {
                  _income = text;
                });
              }),
              _buildSectionTitle('Dietary Requirements'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _facilities.length,
                itemBuilder: (context, index) {
                  return _buildCheckboxListTile(index);
                },
              ),
              if (_selectedFacilities[4]) ...[
                _buildSectionTitle('What are your allergen Information'),
                _buildTextField(_feedbackController, 'Enter your allergen information here', null, maxLines: 3),
              ],
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildButton('Exit', () => Navigator.pop(context)),
                  const SizedBox(width: 10), // Add some spacing between the buttons
                  _buildButton('Proceed', () {
                    if (_selectedPlan.toString() == 'PlanType.shortTerm')
                      {
                        selectedPlan = 'Short Term';
                      }
                    if (_selectedPlan.toString() == 'PlanType.longTerm')
                      {
                        selectedPlan = 'Long Term';
                      }
                    firestoreService.addTaker(
                      _name,
                      selectedPlan,
                      int.parse(_familyMembers),
                      int.parse(_income),
                      _selectedFacilitiesString,
                    );
                    _showPopupDialog(context); // Show pop-up dialog
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, Function(String)? onChanged, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.lightGreen[200], // Similar background color for text fields
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.blueGrey),
      ),
      maxLines: maxLines,
    );
  }

  Widget _buildRadioListTile(PlanType value, String title) {
    return RadioListTile<PlanType>(
      title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      value: value,
      groupValue: _selectedPlan,
      onChanged: (PlanType? value) {
        setState(() {
          _selectedPlan = value;
        });
      },
      activeColor: Colors.amber[100], // Amber outer ring for radio buttons
    );
  }

  Widget _buildCheckboxListTile(int index) {
    return CheckboxListTile(
      title: Text(_facilities[index], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      value: _selectedFacilities[index],
      onChanged: (bool? value) {
        setState(() {
          _selectedFacilities[index] = value ?? false;
          _updateSelectedFacilitiesString();
        });
      },
      activeColor: Colors.amber[100], // Amber outer ring for checkboxes
      checkColor: Colors.black, // Black check color
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen[200], // Button background color
          side: BorderSide(color: Colors.amber[100]!, width: 5), // Amber outer ring
          shadowColor: Colors.black,
          elevation: 6,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.black), // Button text color
        ),
      ),
    );
  }

  void _updateSelectedFacilitiesString() {
    final selectedFacilities = _facilities
        .where((facility) => _selectedFacilities[_facilities.indexOf(facility)])
        .join(', ');
    setState(() {
      _selectedFacilitiesString = selectedFacilities;
    });
  }

  void _showPopupDialog(BuildContext context) {
    String summaryText = 'Name: $_name\n'
        'Family Members: $_familyMembers\n'
        'Monthly Income: $_income\n'
        'Plan Type: ${_selectedPlan == PlanType.longTerm ? 'Long Term' : 'Short Term'}\n'
        'Dietary Requirements: $_selectedFacilitiesString';

    double familyMembersFloat = double.tryParse(_familyMembers) ?? 0.0;
    double incomeFloat = double.tryParse(_income) ?? 0.0;
    double gipp = incomeFloat / familyMembersFloat;
    String tier = "Tier 0";
    if (gipp <= 1000 && gipp > 500) {
      tier = "Tier 2";
    } else if (gipp <= 2000 && gipp > 1000) {
      tier = "Tier 1";
    } else if (gipp <= 500 && gipp >= 0) {
      tier = "Tier 3";
    } else if (gipp > 3000) {
      tier = "Tier 0";
    }
    showDialog(
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop(tier); // Return the tier value
                Navigator.pop(context, tier); // Exit the page and return tier
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(home: CollectionPage()));
}
