import 'package:flutter/material.dart';

import './tabscreen.dart';

class Ticket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Ticket'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text(
                  'Your Ticket',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/bus7.jpg', height: 90),
                        Text(
                          'Tasadduq \n Travels Company',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildTicket('Passenger Name :', 'Waqas Wattu'),
                  buildTicket('Email :', 'Tasaduq.wtu'),
                  buildTicket('Phone Number :', '03124588956'),
                  buildTicket('Bus Number :', 'JL5698'),
                  buildTicket('From :', 'Bahawalnagar'),
                  buildTicket('To :', 'Islamabad'),
                  buildTicket('Journey Date :', '02-11-2021'),
                  buildTicket('Time :', '10:30 pm'),
                  buildTicket('Bus Condition :', 'Non A/C'),
                  buildTicket('Total Seats :', '3'),
                  buildTicket('Total Amount :', 'Rs.4500.00'),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return HomeScreen();
                }));
              },
              child: Container(
                width: double.infinity,
                height: 48,
                margin:
                    EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    'Back',
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
}

Widget buildTicket(String text, String text1) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.blue.shade800, fontSize: 16),
        ),
        Text(
          text1,
          style: TextStyle(fontSize: 16),
        )
      ],
    ),
  );
}
