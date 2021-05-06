import 'package:flutter/material.dart';

class SendEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Send Email'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'To :',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Subject :',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Message :',
              ),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                //   return Payment();
                // }));
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
                    'Send',
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
