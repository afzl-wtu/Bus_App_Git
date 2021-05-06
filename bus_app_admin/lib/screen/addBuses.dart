import 'package:flutter/material.dart';

class AddBuses extends StatefulWidget {
  @override
  _AddBusesState createState() => _AddBusesState();
}

class _AddBusesState extends State<AddBuses> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Buses'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Bus Detail',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Travels Name :',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Bus Number :',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
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
                'Bus Condition :',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ctx) {
                //       return SearchBuses();
                //     },
                //   ),
                // );
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
                    'Add Bus',
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
      ),
    );
  }
}
