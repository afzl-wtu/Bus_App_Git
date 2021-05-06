import 'package:flutter/material.dart';

import './cardInformation.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

enum Type { Type1, Type2, Type3, Type4 }

class _PaymentState extends State<Payment> {
  Type myType = Type.Type1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              child: Center(
                child: Text(
                  'Chose Payment Method',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
            ),
            RadioListTile<Type>(
                title: Text('Credit Card'),
                value: Type.Type1,
                groupValue: myType,
                onChanged: (Type type) {
                  setState(() {
                    myType = type;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: Divider(thickness: 1),
            ),
            RadioListTile<Type>(
                title: Text('Debit Card'),
                value: Type.Type2,
                groupValue: myType,
                onChanged: (Type type) {
                  setState(() {
                    myType = type;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: Divider(thickness: 1),
            ),
            RadioListTile<Type>(
                title: Text('Net Banking'),
                value: Type.Type3,
                groupValue: myType,
                onChanged: (Type type) {
                  setState(() {
                    myType = type;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: Divider(thickness: 1),
            ),
            RadioListTile<Type>(
                title: Text('Wallets'),
                value: Type.Type4,
                groupValue: myType,
                onChanged: (Type type) {
                  setState(() {
                    myType = type;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: Divider(thickness: 1),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return CardInformation();
                }));
              },
              child: Container(
                width: double.infinity,
                height: 48,
                margin:
                    EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    'Next',
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
