import 'package:bus_tick/models/bus_model.dart';
import 'package:bus_tick/models/route_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewBuses extends StatelessWidget {
  final List<BusModel> buses = List.generate(
    5,
    (index) => BusModel(
      busname: (index + 1).toString(),
      busNo: 'CF5468',
      totalseats: 45,
      busCondition: 'A/C',
      routes: List.generate(
        5,
        (index) => RouteModel(
          from: index.toString(),
          to: (index + 5).toString(),
          fromTime: DateTime.now(),
          toTime: DateTime.now().add(
            Duration(days: 5),
          ),
          costPerSeat: 200,
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('View Buses'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView.separated(
          itemBuilder: (_, i) => ExpansionTile(
                leading: CircleAvatar(
                  child: Text(buses[i].busname),
                ),
                title: Text(buses[i].busNo.toString()),
                subtitle: Text(buses[i].busCondition),
                children: buses[i]
                    .routes
                    .map((e) => Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('From: ${e.from}'),
                                      Spacer(),
                                      Text(
                                          'Time: ${DateFormat('yyyy-MM-dd hh:mm').format(e.fromTime)}'),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text('Destination: ${e.to}'),
                                      Spacer(),
                                      Text(
                                          'Time: ${DateFormat('yyyy-MM-dd hh:mm').format(e.toTime)}')
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text('Cost Per Seat: ${e.costPerSeat}'),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
          separatorBuilder: (_, i) => Divider(thickness: 1),
          itemCount: buses.length),
    );
  }
}
