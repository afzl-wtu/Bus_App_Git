import 'package:bus_tick/screen/addBuses.dart';
import 'package:bus_tick/screen/viewBuses.dart';
import 'package:bus_tick/screen/viewTickets.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Admin Panel'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Admin',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50),
            buildInkWell('Add Buses', 0, context),
            buildInkWell('View Buses', 1, context),
            buildInkWell('View Tickets', 2, context),
          ],
        ),
      ),
    );
  }

  InkWell buildInkWell(String text, int tileNumber, BuildContext context) {
    return InkWell(
      onTap: () {
        // ignore: missing_return
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          switch (tileNumber) {
            case 0:
              return AddBuses();
              break;
            case 1:
              return ViewBuses();
              break;
            case 2:
              return ViewTickets();
              break;

            default:
          }
        }));
      },
      child: Container(
        width: 160,
        height: 160,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.amber.shade700,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
