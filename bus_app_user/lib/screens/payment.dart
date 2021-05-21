import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

import 'package:ticket_bus/models/ticket_modal.dart';
import 'package:ticket_bus/screens/ticket.dart';

class Payment extends StatefulWidget {
  final TicketModal ticket;
  Payment(this.ticket);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51IpsruCW3b1KcooqJWnZI00ScZSDNWTAhe3O4d7T8tT1LVZiuv6o9SIY0PVneDSdWoD0pnNaGa76u8vEY9XHTLVm00c3WPwmex'));
    super.initState();
  }

  Future<void> startPayment() async {
    // PaymentMethod _paymentMethod=PaymentMethod(card: CreditCard(number: ,expMonth: ,expYear: ,cvc: ));

    //startStartDirectCharge(_paymentMethod);
  }

  Future<void> startStartDirectCharge(PaymentMethod a) async {
    print('PP direct charge Started');
    final http.Response response = await http.post(Uri.parse(null));
    if (response != null) {
      final paymentIntent = jsonDecode(response.body);
      final status = paymentIntent['paymentIntent']['status'];
      final acc = paymentIntent['stripeAccount'];
      if (status == 'succeeded')
        print('Payment status Succeeded');
      else
        print('payment Failded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f9fc),
      appBar: AppBar(
        title: Text('Payment With Stripe'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/creditCard.jpg'),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'Card Number :',
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
                    decoration: InputDecoration(
                        hintText: '0000 0000 0000 0000',
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'MM/YY :',
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
                    decoration: InputDecoration(
                        hintText: 'MM/YY', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                'CVC :',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'CVC', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                startPayment();
                // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                //   return Ticket();
                // }));
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
                    child: FittedBox(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
