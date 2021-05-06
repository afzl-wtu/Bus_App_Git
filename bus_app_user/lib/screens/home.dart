import 'package:flutter/material.dart';
import './searchBuses.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String chosenCity;
  List listofCities = [
    'Lahore',
    'Karachi',
    'Multan',
    'Sahiwal',
    'Islamabad',
    'Sialkot',
  ];
  String chosenCity1;
  List listofCities1 = [
    'Bahawalnagar',
    'Karachi',
    'Multan',
    'Bahawalpur',
    'Islamabad',
    'Sialkot',
  ];
  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    DateTime datepicker = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (datepicker != null && datepicker != date) {
      setState(() {
        date = datepicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'Tasadduq',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'Travelling Company',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 100),
            child: Text(
              'From :',
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 20),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(7),
            ),
            child: DropdownButton(
              hint: Text('Chose City'),
              underline: SizedBox(),
              iconSize: 30,
              isExpanded: true,
              value: chosenCity,
              onChanged: (newCity) {
                setState(() {
                  chosenCity = newCity;
                });
              },
              items: listofCities.map((e) {
                return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                    ));
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'To :',
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 20),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(7),
            ),
            child: DropdownButton(
              hint: Text('Chose City'),
              underline: SizedBox(),
              iconSize: 30,
              isExpanded: true,
              value: chosenCity1,
              onChanged: (newCity) {
                setState(() {
                  chosenCity1 = newCity;
                });
              },
              items: listofCities1.map((e) {
                return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                    ));
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Select Date :',
            ),
          ),
          InkWell(
            onTap: () {
              selectTimePicker(context);
            },
            child: Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  // ignore: unnecessary_brace_in_string_interps
                  Text('${date.day} - ${date.month} - ${date.year}'),
                  // Text(date.month.toString()),
                  // Text(date.year.toString()),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return SearchBuses();
                  },
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(left: 20, top: 80, right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Search Buses',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
