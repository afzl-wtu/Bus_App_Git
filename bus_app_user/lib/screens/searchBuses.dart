import 'package:flutter/material.dart';
import 'package:ticket_bus/models/bus_model.dart';
import 'package:ticket_bus/models/route_model.dart';
import 'package:ticket_bus/screens/contactPassenger.dart';

class SearchBuses extends StatelessWidget {
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
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return ContactPassenger();
                  }));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bus Name :     ${buses[i].busname}'),
                    SizedBox(height: 2),
                    Text('Bus Number :     ${buses[i].busNo}'),
                    SizedBox(height: 2),
                    Text('Total Seats :     ${buses[i].totalseats}'),
                    SizedBox(height: 2),
                    Text('Bus Condition :     ${buses[i].busCondition}'),
                    SizedBox(height: 2),
                    Text(
                        'Cost Per Seat :     ${buses[i].routes[i].costPerSeat}'),
                    SizedBox(height: 2),
                    Text('From :     ${buses[i].routes[i].from}'),
                    SizedBox(height: 2),
                    Text('From Time :     ${buses[i].routes[i].fromTime}'),
                    SizedBox(height: 2),
                    Text('To :     ${buses[i].routes[i].to}'),
                    SizedBox(height: 2),
                    Text('To Time :     ${buses[i].routes[i].toTime}'),
                  ],
                )
                // child: Row(
                //   children: [
                //     Icon(
                //       Icons.directions_bus_outlined,
                //       size: 100,
                //       color: Colors.amber,
                //     ),
                //     Expanded(child: Container()),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         SizedBox(height: 8),
                //         Container(
                //             padding: EdgeInsets.only(bottom: 10),
                //             child: Text(
                //               buses[i].busname,
                //               style: TextStyle(
                //                   color: Colors.blue.shade800,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold),
                //             )),
                //         Text('Bus Number : ${buses[i].busNo}'),
                //         Text('From : }'),
                //         Text('To : }'),
                //         Text('Time : '),
                //         Text('Bus Condition : ${buses[i].busCondition}'),
                //       ],
                //     ),
                //     SizedBox(width: 10),
                //   ],
                // ),
                ),
          );
        },
      ),
    );
  }
}
