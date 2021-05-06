import 'package:flutter/material.dart';

import '../models/busesDetail.dart';
import './selectSeats.dart';

class SearchBuses extends StatelessWidget {
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
        itemCount: busDetail.length,
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
                  Image.asset(busDetail[i].busImage, height: 100),
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            busDetail[i].busname,
                            style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      Text('Bus Number : ${busDetail[i].busNo}'),
                      Text('Journey Date : ${busDetail[i].journeyDate}'),
                      Text('From : ${busDetail[i].from}'),
                      Text('To : ${busDetail[i].to}'),
                      Text('Time : ${busDetail[i].time}'),
                      Text('Bus Condition : ${busDetail[i].busCondition}'),
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
