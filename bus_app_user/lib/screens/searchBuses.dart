import 'package:flutter/material.dart';
import 'package:ticket_bus/models/bus_model.dart';
import 'package:ticket_bus/screens/contactPassenger.dart';

class SearchBuses extends StatelessWidget {
  final List<BusModel> buses;
  final String fromCity;
  final String toCity;
  final DateTime chosenDate;
  final String seats;

  SearchBuses({
    @required this.buses,
    @required this.fromCity,
    @required this.toCity,
    @required this.chosenDate,
    @required this.seats,
  });

  List<BusModel> get _busesToShow {
    final a = buses
        .where(
          (element) => (element.routes.any(
            (elementt) => (elementt.from == fromCity && elementt.to == toCity),
          )),
        )
        .toList();
    List<BusModel> b = [];
    a.forEach((element) {
      element.routes.forEach(
        (elementt) {
          if (elementt.from == fromCity && elementt.to == toCity)
            b.add(
              BusModel(
                routes: [elementt],
                totalSeats: element.totalSeats,
                busName: element.busName,
                busCondition: element.busCondition,
                busNo: element.busNo,
              ),
            );
        },
      );
    });
    return b;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Select Bus'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: _busesToShow.length,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return ContactPassenger(
                      numberOfSeats: seats,
                      chosenBus: _busesToShow[i],
                      chosenDate: chosenDate,
                    );
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bus Name :        ${_busesToShow[i].busName}'),
                      SizedBox(height: 2),
                      Text('Bus Number :     ${_busesToShow[i].busNo}'),
                      SizedBox(height: 2),
                      Text('Total Seats :       ${_busesToShow[i].totalSeats}'),
                      SizedBox(height: 2),
                      Text(
                          'Bus Condition :    ${_busesToShow[i].busCondition}'),
                      SizedBox(height: 2),
                      Text(
                          'Cost Per Seat :     ${_busesToShow[i].routes[0].costPerSeat}'),
                      SizedBox(height: 2),
                      Text(
                          'From :                    ${_busesToShow[i].routes[0].from}'),
                      SizedBox(height: 2),
                      Text(
                          'From Time :         ${_busesToShow[i].routes[0].fromTime}'),
                      SizedBox(height: 2),
                      Text(
                          'To :                     ${_busesToShow[i].routes[0].to}'),
                      SizedBox(height: 2),
                      Text(
                          'To Time :        ${_busesToShow[i].routes[0].toTime}'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
