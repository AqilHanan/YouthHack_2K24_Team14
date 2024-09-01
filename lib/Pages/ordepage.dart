// fifth_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//import 'booking_summary_screen.dart'; // Import the booking summary screen

class OrderPage extends StatefulWidget {
  final String value;

  OrderPage({Key? key, required this.value}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String str1 = '';
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

  void _bookFacility() {
    if (selectedDate != null && selectedTime != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              'Confirm',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            content: Text(
              'Are you sure you want to collect on ${DateFormat('dd/MM/yyyy').format(selectedDate!)} at ${selectedTime!.format(context)}?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingSummaryScreen(
                        location: str1,
                        date: selectedDate!,
                        time: selectedTime!,
                        str1: str1,
                        selectedDate: selectedDate!,
                      ),
                    ),
                  );
                  */
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a date and time.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value == '1') {
      str1 = 'Jurong East CC';
    } else if (widget.value == '2') {
      str1 = 'Jln Kukoh RC';
    } else if (widget.value == '3') {
      str1 = 'Tampines CC';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Page '),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Exit'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                child: Text(
                  str1,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              if (widget.value == '1') ...[
                Image.asset('lib/images/JE.jpg'),
              ] else if (widget.value == '2') ...[
                Image.asset('lib/images/JK.jpg'),
              ] else if (widget.value == '3') ...[
                Image.asset('lib/images/TCC.jpg'),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  selectedDate == null
                      ? 'Select date'
                      : 'Selected date: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}',
                ),
              ),
              const SizedBox(height: 20),
              if (selectedDate != null) ...[
                DropdownButton<TimeOfDay>(
                  value: selectedTime,
                  hint: Text('Select time'),
                  items: _availableTimeSlots.map((TimeOfDay time) {
                    return DropdownMenuItem<TimeOfDay>(
                      value: time,
                      child: Text(time.format(context)),
                    );
                  }).toList(),
                  onChanged: (TimeOfDay? newValue) {
                    setState(() {
                      selectedTime = newValue;
                    });
                  },
                ),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _bookFacility,
                child: const Text('Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
