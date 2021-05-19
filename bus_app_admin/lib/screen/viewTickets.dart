import 'package:bus_tick/models/ticket_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewTickets extends StatelessWidget {
  final List<TicketModal> passengerTicket = List.generate(
    5,
    (index) => TicketModal(
      passengerName: 'Tasadduq',
      passengerAge: 23,
      passengerNumber: '0306 9876540',
      passengerEmail: 'tasadaq.@gmail.com',
      busName: 'Seato Company',
      busNumber: 'GHJ7689',
      from: 'Bahawalnagar',
      fromTime: DateTime.now(),
      to: 'Islamabad',
      date: DateTime.now(),
      totalSeats: 15,
      totalSeatsCost: 4500,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Tickets'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, i) => SizedBox(
          height: 300,
          child: Card(
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 5),
              children: [
                Column(children: [
                  Text('Passenger Name', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].passengerName}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Bus Name', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].busName}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Passenger Age', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].passengerAge}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Bus Number', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].busNumber}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Passenger Email', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].passengerEmail}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('From', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].from}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Passenger Number',
                      style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].passengerNumber}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('From Time', style: TextStyle(color: Colors.grey)),
                  Text(
                      '${DateFormat('hh:mm yyyy/mm/dd').format(passengerTicket[i].fromTime)}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Total Seats', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].totalSeats}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('To', style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].to}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Total Seats Cost',
                      style: TextStyle(color: Colors.grey)),
                  Text('${passengerTicket[i].totalSeatsCost}',
                      style: TextStyle(color: Colors.black)),
                ]),
                Column(children: [
                  Text('Date', style: TextStyle(color: Colors.grey)),
                  Text(
                      '${DateFormat('hh:mm yyyy/mm/dd').format(passengerTicket[i].date)}',
                      style: TextStyle(color: Colors.black)),
                ]),

                // Text(
                //     'Passenger Name :     ${passengerTicket[i].passengerName}'),
                // Text('Passenger Age :     ${passengerTicket[i].passengerAge}'),
                // Text(
                //     'Passenger Number :     ${passengerTicket[i].passengerNumber}'),
                // Text(
                //     'Passenger Email :     ${passengerTicket[i].passengerEmail}'),
                // Text('Bus Name :     ${passengerTicket[i].busName}'),
                // Text('Bus Number :     ${passengerTicket[i].busNumber}'),
                // Text('From :     ${passengerTicket[i].from}'),
                // Text('From Time :     ${passengerTicket[i].fromTime}'),
                // Text('To :     ${passengerTicket[i].to}'),
                // Text('Date :     ${passengerTicket[i].date}'),
                // Text('Total Seats  :     ${passengerTicket[i].totalSeats}'),
                // Text('Chose Seats :     ${passengerTicket[i].choseSeats}'),
                // Text(
                //     'Total Seats Cost :     ${passengerTicket[i].totalSeatsCost}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
