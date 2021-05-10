import 'package:bus_tick/models/route_model.dart';
import 'package:bus_tick/widgets/my_textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<RouteModel> _routes = [];
  final busesRef = FirebaseFirestore.instance.collection('buses');
  Future<void> _addBus() async {
    setState(() {
      _isUploading = true;
    });
    try {
      final _response = await busesRef.add({
        'busName': _busNameController.text,
        'busNumber': _busNumberController.text,
        'busCondition': _busConditionController.text,
        'totalNumberOfSeats': _totalNumberOfSeatController.text,
        'busRoutes': _routes
            .map((e) => {
                  'costPerSeat': e.costPerSeat ?? '',
                  'from': e.from ?? '',
                  'to': e.to ?? '',
                  'fromTime': e.fromTime ?? '',
                  'toTime': e.toTime ?? '',
                })
            .toList(),
      });
      setState(() {
        _busConditionController.clear();
        _busNumberController.clear();
        _busNameController.clear();
        _totalNumberOfSeatController.clear();
        _routes = [];
        _isUploading = false;
      });
    } catch (error) {
      setState(() {
        print('PP Error in response of addBuse: $error');
        _isError = true;
      });
    }
  }

  bool _isUploading = false;
  bool _isError = false;
  void dispose() {
    _fromCityController.dispose();
    _fromCityTimeController.dispose();
    _toCityController.dispose();
    _toCityTimeController.dispose();
    _busNameController.dispose();
    _busNumberController.dispose();
    _busConditionController.dispose();
    _costPerSeatController.dispose();
    _totalNumberOfSeatController.dispose();
    super.dispose();
  }

  void bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myTextField('From City', _fromCityController),
                myTextField('Time', _fromCityTimeController, true, context),
                myTextField('To City', _toCityController),
                myTextField('Time', _toCityTimeController, true, context),
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
                          onPressed: () {
                            print('PP done button Pressed');
                            if (_fromCityController.text.isNotEmpty &&
                                _costPerSeatController.text.isNotEmpty) {
                              _addRoute();
                              Navigator.pop(context);
                            }
                          },
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
                          onPressed: () {
                            if (_fromCityController.text.isNotEmpty &&
                                _costPerSeatController.text.isNotEmpty) {
                              _addRoute();
                              _fromCityController.clear();
                              _toCityController.clear();
                              _fromCityTimeController.clear();

                              _toCityTimeController.clear();
                            }
                          },
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
            ),
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
                _isError
                    ? Navigator.pop(context)
                    : _isUploading
                        ? print('Uploading Document')
                        : _addBus();
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
                  child: _isError
                      ? Icon(Icons.error_outline)
                      : _isUploading
                          ? CircularProgressIndicator()
                          : Text(
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

  void _addRoute() {
    _routes.add(RouteModel(
      from: _fromCityController.text,
      to: _toCityController.text,
      fromTime: _fromCityTimeController.text,
      toTime: _toCityTimeController.text,
      costPerSeat: double.parse(_costPerSeatController.text),
    ));
  }
}
