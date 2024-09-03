import 'package:flutter/material.dart';
import 'package:youth_hack_2k24_group14/services/firestore.dart';

class TestGiverPage extends StatefulWidget {
  const TestGiverPage({super.key});

  @override
  State<TestGiverPage> createState() => _TestGiverPageState();
}

enum Type { business, individual }

class _TestGiverPageState extends State<TestGiverPage> {
  //firestore

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
      appBar: AppBar(
        title: const Text('TestGiverPage'),
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
                  style: TextStyle(fontSize: 24),
                ),
              ),

              // Type Business or Individual
              RadioListTile<Type>(
                title: const Text('Business'),
                value: Type.business,
                groupValue: _selectedType,
                onChanged: (Type? value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              RadioListTile<Type>(
                title: const Text('Individual'),
                value: Type.individual,
                groupValue: _selectedType,
                onChanged: (Type? value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Name
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              TextField(
                controller: _nameGiverController,
                onChanged: (text) {
                  setState(() {
                    _nameGiver = text;
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

              // Dietary Requirements
              SizedBox(height: 20),
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
                itemCount: _dietType.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_dietType[index]),
                    value: _selectedDietType[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedDietType[index] = value ?? false;
                        _updateSelectedDietTypeString();
                      });
                    },
                  );
                },
              ),

              // Is the food cooked?
              SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Is the food cooked?',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              CheckboxListTile(
                title: Text("Food is Cooked"),
                value: cooked,
                onChanged: (value) {
                  setState(() {
                    cooked = value!;
                  });
                },
              ),

              // Expiry Date
              SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Expiry Date',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
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
                    child: Text("Select Date"),
                  ),
                  Text("${expdate.day}/${expdate.month}/${expdate.year}"),
                ],
              ),

              // Date and Time Selection
              SizedBox(height: 20),

              //submit button
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  child:ElevatedButton(onPressed: (){
                    firestoreService.addGiver(
                        _selectedType.toString(),
                        _nameGiver,
                        _selectedDietTypeString,
                        cooked,
                        expdate);
                    Navigator.pop(context);
                  },
                    child: Text("Submit"),
                  ),
                ),
              )
            ],
          ),
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
