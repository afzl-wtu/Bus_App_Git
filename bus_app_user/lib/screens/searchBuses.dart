import 'package:flutter/material.dart';
import 'package:ticket_bus/models/bus_model.dart';

import './selectSeats.dart';

class SearchBuses extends StatelessWidget {
  List<BusModel> buses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Search Buses'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView.builder(
        itemCount: buses.length,
        itemBuilder: (ctx, i) {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 6),
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return SelectSeats();
                }));
              },
              child: Row(
                children: [
                  Image.asset(buses[i].busImage, height: 100),
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            buses[i].busname,
                            style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      Text('Bus Number : ${buses[i].busNo}'),
                      Text('From : }'),
                      Text('To : }'),
                      Text('Time : '),
                      Text('Bus Condition : ${buses[i].busCondition}'),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
