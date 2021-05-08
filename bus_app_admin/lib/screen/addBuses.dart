import 'package:bus_tick/widgets/my_textField.dart';
import 'package:flutter/material.dart';

class AddBuses extends StatefulWidget {
  @override
  _AddBusesState createState() => _AddBusesState();
}

class _AddBusesState extends State<AddBuses> {
  final TextEditingController _fromCityController = TextEditingController();
  final TextEditingController _fromCityTimeController = TextEditingController();
  final TextEditingController _toCityController = TextEditingController();
  final TextEditingController _toCityTimeController = TextEditingController();
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _busConditionController = TextEditingController();
  final TextEditingController _costPerSeatController = TextEditingController();
  final TextEditingController _totalNumberOfSeatController =
      TextEditingController();

  void bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myTextField('From City', _fromCityController),
              myTextField('Time', _fromCityTimeController),
              myTextField('To City', _toCityController),
              myTextField('Time', _toCityTimeController),
              myTextField('Cost Per Seat', _costPerSeatController),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Add More ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

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
            myTextField('Bus Name', _busNameController),
            myTextField('Bus Number', _busNumberController),
            myTextField('Bus Condition', _busConditionController),
            myTextField('Total Number Of Seat', _totalNumberOfSeatController),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                onPressed: () {
                  bottomSheet(context);
                },
                child: Text(
                  'Add Routes',
                  style: TextStyle(color: Colors.black),
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
