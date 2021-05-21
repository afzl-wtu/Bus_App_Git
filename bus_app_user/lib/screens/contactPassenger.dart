import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticket_bus/models/bus_model.dart';
import 'package:ticket_bus/models/ticket_modal.dart';
import './payment.dart';

class ContactPassenger extends StatelessWidget {
  final String numberOfSeats;
  final DateTime chosenDate;
  final BusModel chosenBus;
  ContactPassenger({
    @required this.numberOfSeats,
    @required this.chosenDate,
    @required this.chosenBus,
  });
  final phoneNumberControler = TextEditingController();
  final nameControler = TextEditingController();
  final ageControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contact Passenger'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Phone Number :',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: phoneNumberControler,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Name :',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: nameControler,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Age :',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: ageControler,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (phoneNumberControler.text.isNotEmpty &&
                    ageControler.text.isNotEmpty &&
                    nameControler.text.isNotEmpty)
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return Payment(TicketModal(
                      passengerName: nameControler.text,
                      passengerAge: int.parse(ageControler.text),
                      passengerEmail: FirebaseAuth.instance.currentUser.email,
                      passengerNumber: phoneNumberControler.text,
                      busName: chosenBus.busName,
                      busNumber: chosenBus.busNo,
                      date: chosenDate,
                      totalSeats: int.parse(numberOfSeats),
                      totalSeatsCost: chosenBus.routes[0].costPerSeat,
                      from: chosenBus.routes[0].from,
                      fromTime: chosenBus.routes[0].fromTime,
                      to: chosenBus.routes[0].to,
                    ));
                  }));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 10),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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
