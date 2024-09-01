import 'package:flutter/material.dart';

class TestGiverPage extends StatefulWidget {
  const TestGiverPage({super.key});

  @override
  State<TestGiverPage> createState() => _TestGiverPageState();
}

enum Type { business, individual }


class _TestGiverPageState extends State<TestGiverPage> {
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
    false,
  ];

  final _nameGiverController = TextEditingController();
  Type? _selectedType = Type.business;

  String _nameGiver = '';
  String _selectedDietTypeString = '';
  bool cooked = false;
  DateTime expdate = DateTime(1,8,2024);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('TestGiverPage')
      ),
      //PLEASE FEEL FREE TO CHANGE THE BODY i put this as a placeholder
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello from TestGiverPage"),
              SizedBox(height: 50,),

              //type business or indiv
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
              SizedBox(height: 20,),


              //name


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


              //dietType


              SizedBox(height: 20,),

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


               //cooked or not


              SizedBox(height: 20,),

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
                  onChanged: (value){
                    setState(() {
                      cooked = value!;
                    });
                  }),


              //expiry date


              SizedBox(height: 20,),

              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Expiry Date',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: expdate,
                      firstDate:DateTime(1900),
                      lastDate:DateTime(2100),
                    );
                  },
                      child: Text(
                          "Select Date")
                  ),
                  Text("${expdate.day}/${expdate.month}/$expdate.year")
                ],
              ),


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

