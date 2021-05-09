import 'package:bus_tick/models/ticket_modal.dart';
import 'package:flutter/material.dart';

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
      choseSeats: 4,
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
        itemBuilder: (ctx, i) => Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Passenger Name :     ${passengerTicket[i].passengerName}'),
                Text('Passenger Age :     ${passengerTicket[i].passengerAge}'),
                Text(
                    'Passenger Number :     ${passengerTicket[i].passengerNumber}'),
                Text(
                    'Passenger Email :     ${passengerTicket[i].passengerEmail}'),
                Text('Bus Name :     ${passengerTicket[i].busName}'),
                Text('Bus Number :     ${passengerTicket[i].busNumber}'),
                Text('From :     ${passengerTicket[i].from}'),
                Text('From Time :     ${passengerTicket[i].fromTime}'),
                Text('To :     ${passengerTicket[i].to}'),
                Text('Date :     ${passengerTicket[i].date}'),
                Text('Total Seats  :     ${passengerTicket[i].totalSeats}'),
                Text('Chose Seats :     ${passengerTicket[i].choseSeats}'),
                Text(
                    'Total Seats Cost :     ${passengerTicket[i].totalSeatsCost}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
