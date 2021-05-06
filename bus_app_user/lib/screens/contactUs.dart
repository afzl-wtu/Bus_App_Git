import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 250,
              width: double.infinity,
              child: Image.asset('assets/images/bus4.jpg', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              'Tasadduq',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Travelling Company',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Main Branch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Home : 21-8888-000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Mobile : 0306-0000000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Email : tsadaq.@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
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
