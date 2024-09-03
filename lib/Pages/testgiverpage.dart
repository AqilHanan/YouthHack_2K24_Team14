import 'package:flutter/material.dart';
import 'package:youth_hack_2k24_group14/services/firestore.dart';

class TestGiverPage extends StatefulWidget {
  const TestGiverPage({super.key});

  @override
  State<TestGiverPage> createState() => _TestGiverPageState();
}

enum Type { business, individual }

class _TestGiverPageState extends State<TestGiverPage> {
  final FirestoreService firestoreService = FirestoreService();

  final List<String> _dietType = [
    'Halal',
    'Vegan',
    'Vegetarian',
    'Kosher',
  ];
  final List<bool> _selectedDietType = [
    false,
    false,
    false,
    false,
  ];

  final _nameGiverController = TextEditingController();
  Type? _selectedType = Type.business;
  String selectedType = '';

  String _nameGiver = '';
  String _selectedDietTypeString = '';
  bool cooked = false;
  DateTime expdate = DateTime(2024, 8, 1);
  String _Type = '';

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<TimeOfDay> _availableTimeSlots = [];

  @override
  void initState() {
    super.initState();
    _generateTimeSlots();
  }

  void _generateTimeSlots() {
    final now = TimeOfDay.now();
    final startHour = 8;
    final endHour = 20;

    if (selectedDate == null) {
      _availableTimeSlots = [];
      return;
    }

    bool isToday = selectedDate!.day == DateTime.now().day &&
        selectedDate!.month == DateTime.now().month &&
        selectedDate!.year == DateTime.now().year;

    _availableTimeSlots = [];

    for (int hour = startHour; hour <= endHour; hour++) {
      final slot = TimeOfDay(hour: hour, minute: 0);
      if (!isToday ||
          (slot.hour > now.hour ||
              (slot.hour == now.hour && slot.minute > now.minute))) {
        _availableTimeSlots.add(slot);
      }
    }

    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedTime = null;
        _generateTimeSlots();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[200], // Match the background color
      appBar: AppBar(
        title: const Text('Giver Information'),
        backgroundColor: Colors.lightGreen[200],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Business or Individual?',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),

              // Type Business or Individual
              _buildStyledRadioOption(Type.business, 'Business'),
              _buildStyledRadioOption(Type.individual, 'Individual'),

              // Name
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _nameGiverController,
                  onChanged: (text) {
                    setState(() {
                      _nameGiver = text;
                    });
                  },
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.lightGreen[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.amber[100]!,
                        width: 3,
                      ),
                    ),
                    hintText: 'Enter Here',
                    hintStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),

              // Dietary Requirements
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Dietary Requirements',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _dietType.length,
                  itemBuilder: (context, index) {
                    return _buildStyledCheckboxOption(index);
                  },
                ),
              ),

              // Is the food cooked?
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Is the food cooked?',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: _buildStyledCheckboxTile(
                  title: "Food is Cooked",
                  value: cooked,
                  onChanged: (value) {
                    setState(() {
                      cooked = value!;
                    });
                  },
                ),
              ),

              // Expiry Date
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Expiry Date',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen[200],
                        side: BorderSide(color: Colors.amber[100]!, width: 3),
                      ),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: expdate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (newDate != null) {
                          setState(() {
                            expdate = newDate;
                          });
                        }
                      },
                      child: Text("Select Date", style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    const SizedBox(width: 20),
                    Text("${expdate.day}/${expdate.month}/${expdate.year}", style: TextStyle(fontSize: 20, color: Colors.black)),
                  ],
                ),
              ),

              // Submit button
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen[200],
                      side: BorderSide(color: Colors.amber[100]!, width: 3),
                      elevation: 6,
                    ),
                    onPressed: () {
                      firestoreService.addGiver(
                        selectedType,
                        _nameGiver,
                        _selectedDietTypeString,
                        cooked,
                        expdate,
                      );
                      Navigator.pop(context);
                    },
                    child: Text("Submit", style: TextStyle(fontSize: 24, color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledRadioOption(Type type, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedType == type ? Colors.lightGreen[200] : Colors.white,
          side: BorderSide(color: Colors.amber[100]!, width: 3),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedType = type;
            selectedType = title;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            if (_selectedType == type)
              Icon(Icons.check, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledCheckboxOption(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedDietType[index] ? Colors.lightGreen[200] : Colors.white,
          side: BorderSide(color: Colors.amber[100]!, width: 3),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedDietType[index] = !_selectedDietType[index];
            _updateSelectedDietTypeString();
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _dietType[index],
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            if (_selectedDietType[index])
              Icon(Icons.check, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledCheckboxTile({required String title, required bool value, required ValueChanged<bool?> onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: value ? Colors.lightGreen[200] : Colors.white,
          side: BorderSide(color: Colors.amber[100]!, width: 3),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          setState(() {
            onChanged(!value);
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            if (value)
              Icon(Icons.check, color: Colors.black),
          ],
        ),
      ),
    );
  }

  void _updateSelectedDietTypeString() {
    final selectedDietType = _dietType
        .where((diet) => _selectedDietType[_dietType.indexOf(diet)])
        .join(', ');
    setState(() {
      _selectedDietTypeString = selectedDietType;
    });
  }
}
//note: