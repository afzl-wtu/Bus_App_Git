import 'package:bus_tick/screen/addBuses.dart';
import 'package:bus_tick/screen/selectRoute.dart';
import 'package:bus_tick/screen/sendEmail.dart';
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
            SizedBox(height: 150),
            buildInkWell('Add Buses', 0, context),
            buildInkWell('Select Route', 1, context),
            buildInkWell('Send Email', 2, context),
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
              return SelectRoute();
              break;
            case 2:
              return SendEmail();
              break;

            default:
          }
        }));
      },
      child: Container(
        width: double.infinity,
        height: 48,
        margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
