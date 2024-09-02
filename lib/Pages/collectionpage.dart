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
  final TextEditingController _familyMembersController =
      TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  double _rating = 5.0; // Initial value for the slider
  PlanType? _selectedPlan = PlanType.longTerm; // Default selected plan

  String _selectedFacilitiesString = '';

  String selectedPlan = '';
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
                    selectedPlan = 'Long Term';
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
                    selectedPlan = 'Short Term';
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
                        firestoreService.addTaker(
                            _name,
                            selectedPlan,
                            int.parse(_familyMembers),
                            int.parse(_income),
                            _selectedFacilitiesString);
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
