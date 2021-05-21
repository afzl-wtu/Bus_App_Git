import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ticket_bus/models/bus_model.dart';
import './searchBuses.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final busesRef = FirebaseFirestore.instance.collection('buses');
  List<BusModel> _buses;
  List<String> _fromCities;
  List<String> _toCities;

  Future<void> _getdata() async {
    final response = await busesRef.get();
    _buses = BusModel.toList(response);
    List<String> fromCities = [];
    _buses.forEach((e) => e.routes.forEach((ee) => fromCities.add(ee.from)));
    _fromCities = fromCities.toSet().toList();
    List<String> toCities = [];
    _buses.forEach((e) => e.routes.forEach((ee) => toCities.add(ee.to)));
    _toCities = toCities.toSet().toList();
    _firstTime = false;
    print('PP $_fromCities');
  }

  final _choseSeatControler = TextEditingController();
  DateTime _chosenDate = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    DateTime datepicker = await showDatePicker(
      context: context,
      initialDate: _chosenDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (datepicker != null && datepicker != _chosenDate) {
      setState(() {
        _chosenDate = datepicker;
      });
    }
  }

  String _fromChosenCity;
  String _toChosenCity;
  bool _firstTime = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firstTime ? _getdata() : null,
      builder: (_, snap) => snap.connectionState == ConnectionState.waiting
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Center(
                      child: Image.asset('assets/images/logo Bus App.jpeg',
                          height: 200)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'From :',
                                  ),
                                  Container(
                                    width: 300,
                                    // margin:
                                    //     EdgeInsets.only(left: 20, top: 10, right: 20),
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      // color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: DropdownButton(
                                      hint: Text('Choose City'),
                                      iconSize: 30,
                                      isExpanded: true,
                                      value: _fromChosenCity,
                                      onChanged: (newCity) {
                                        setState(() {
                                          _fromChosenCity = newCity;
                                        });
                                      },
                                      items: _fromCities.map((e) {
                                        return DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                            ));
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            (SizedBox(
                              height: 10,
                            )),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'To :',
                                  ),
                                  Container(
                                    width: 300,
                                    // margin:
                                    //     EdgeInsets.only(left: 20, top: 10, right: 20),
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      // color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: DropdownButton(
                                        hint: Text('Choose City'),
                                        iconSize: 30,
                                        isExpanded: true,
                                        value: _toChosenCity,
                                        onChanged: (newCity) {
                                          setState(() {
                                            _toChosenCity = newCity;
                                          });
                                        },
                                        items: _toCities.map((e) {
                                          return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                              ));
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            selectTimePicker(context);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 10,
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 18),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, left: 15),
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'Select Date :',
                                    ),
                                    Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            right: 150,
                                            left: 10),
                                        child: Row(
                                          children: [
                                            // ignore: unnecessary_brace_in_string_interps
                                            Text(
                                                '${_chosenDate.day} - ${_chosenDate.month} - ${_chosenDate.year}'),
                                            // Text(date.month.toString()),
                                            // Text(date.year.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          color: Colors.white,
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10),
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    'Chose Seat :',
                                  ),
                                  Container(
                                    width: 250,
                                    // margin: const EdgeInsets.only(
                                    //     left: 15, top: 10, right: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: TextField(
                                        controller: _choseSeatControler,
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) {
                              return SearchBuses(
                                  fromCity: _fromChosenCity,
                                  toCity: _toChosenCity,
                                  chosenDate: _chosenDate,
                                  seats: _choseSeatControler.text,
                                  buses: _buses);
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.red,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              child: Text(
                                'SEARCH BUSES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
    );
  }
}
