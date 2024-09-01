import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

enum PlanType { longTerm, shortTerm }

class _CollectionPageState extends State<CollectionPage> {
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
  final List<String> _MealPref = [
    'Breakfast',
    'Lunch',
    'Dinner',
  ];
  final List<bool> _selectedPref = [
    false,
    false,
    false,
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _familyMembersController =
      TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  double _rating = 5.0; // Initial value for the slider
  PlanType? _selectedPlan = PlanType.longTerm; // Default selected plan

  String _selectedFacilitiesString = '';
  String _selectedPrefString = '';
  String _name = '';
  String _familyMembers = '';
  String _income = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TakerPage'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 24),
                ),
              ),
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
                  hintStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Plan Type',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              RadioListTile<PlanType>(
                title: const Text('Long Term'),
                value: PlanType.longTerm,
                groupValue: _selectedPlan,
                onChanged: (PlanType? value) {
                  setState(() {
                    _selectedPlan = value;
                  });
                },
              ),
              RadioListTile<PlanType>(
                title: const Text('Short Term'),
                value: PlanType.shortTerm,
                groupValue: _selectedPlan,
                onChanged: (PlanType? value) {
                  setState(() {
                    _selectedPlan = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'How Many Family Members do you have?',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              TextField(
                controller: _familyMembersController,
                onChanged: (text) {
                  setState(() {
                    _familyMembers = text;
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
                  hintStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'What is your total monthly household income',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              TextField(
                controller: _incomeController,
                onChanged: (text) {
                  setState(() {
                    _income = text;
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
                  hintStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Rating',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Slider(
                value: _rating,
                min: 1,
                max: 10000,
                divisions: 9999,
                label: _rating.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Food Requirements',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _MealPref.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_MealPref[index]),
                    value: _selectedPref[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedPref[index] = value ?? false;
                        _updateSelectedPrefString();
                      });
                    },
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Dietary Requirements',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _facilities.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_facilities[index]),
                    value: _selectedFacilities[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedFacilities[index] = value ?? false;
                        _updateSelectedFacilitiesString();
                      });
                    },
                  );
                },
              ),
              if (_selectedFacilities[4]) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'What are your allergen Information',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                TextField(
                  controller: _feedbackController,
                  onChanged: (text) {
                    setState(() {
                      // Do not set allergen information here if it's not used separately
                    });
                  },
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    hintText: 'Enter your allergen information here',
                    hintStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  maxLines: 3,
                ),
              ],
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Exit button
                      },
                      child: const Text('Exit'),
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Add some spacing between the buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showPopupDialog(context); // Show pop-up dialog
                      },
                      child: const Text('Proceed'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateSelectedPrefString() {
    final selectedPrefs =
        _MealPref.where((pref) => _selectedPref[_MealPref.indexOf(pref)])
            .join(', ');
    setState(() {
      _selectedPrefString = selectedPrefs;
    });
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
            'Name: $_name\n'
            'Family Members: $_familyMembers\n'
            'Monthly Income: $_income\n'
            'Plan Type: ${_selectedPlan == PlanType.longTerm ? 'Long Term' : 'Short Term'}\n'
            'Food Preferences: $_selectedPrefString\n'
            'Dietary Requirements: $_selectedFacilitiesString',
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
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(context); // Exit the page
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
