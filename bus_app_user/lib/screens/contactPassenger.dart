import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:ticket_bus/models/bus_model.dart';
import 'package:ticket_bus/models/ticket_modal.dart';
import './payment.dart';

class ContactPassenger extends StatefulWidget {
  final String numberOfSeats;
  final DateTime chosenDate;
  final BusModel chosenBus;
  ContactPassenger({
    @required this.numberOfSeats,
    @required this.chosenDate,
    @required this.chosenBus,
  });

  @override
  _ContactPassengerState createState() => _ContactPassengerState();
}

class _ContactPassengerState extends State<ContactPassenger> {
  final phoneNumberControler = TextEditingController();

  final nameControler = TextEditingController();
  double _totalAmount;
  final CreditCard _testCard = CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 21,
  );
  @override
  void initState() {
    _totalAmount = widget.chosenBus.routes[0].costPerSeat *
        int.parse(widget.numberOfSeats);

    StripePayment.setOptions(
      StripeOptions(
          publishableKey:
              'pk_test_51IpsruCW3b1KcooqJWnZI00ScZSDNWTAhe3O4d7T8tT1LVZiuv6o9SIY0PVneDSdWoD0pnNaGa76u8vEY9XHTLVm00c3WPwmex'),
    );
    super.initState();
  }

  static const String _secKey =
      'sk_test_51IpsruCW3b1Kcooq7BhfnOdWxQGKkA4JZJMQZhAE5S55JCZtrx8gD2ugjXjRa2eujPxUhbhJqrQmRuiQtrGSU7hc00kUFL4pCe';
  PaymentMethod _paymentMethod = PaymentMethod(
      card: CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 21,
  ));
  Future<void> _startPayment() async {
    if (phoneNumberControler.text.isNotEmpty && nameControler.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      _paymentMethod = await StripePayment.paymentRequestWithCardForm(
              CardFormPaymentRequest())
          .then((PaymentMethod value) {
        print('PP in Then Block Value of Card is: ${value.card.number}');
        return value;
      });

      print(
          'PP in before create source Value of Card is: ${_paymentMethod.card.number}');
      var a = await StripePayment.createSourceWithParams(
        SourceParams(
            name: 'AFZAL TAHIR WATTU',
            card: _paymentMethod.card,
            returnURL: 'example://stripe-redirect',
            type: 'ideal',
            amount: _totalAmount.toInt(),
            currency: 'inr'),
      );

      print(
          'PP in before create token Value of Card is: ${_paymentMethod.card.number}');
      var _token = await StripePayment.createTokenWithCard(_testCard);
      // await StripePayment.confirmSetupIntent(PaymentIntent(
      //   clientSecret: _secKey,
      //   returnURL: 'example://stripe-redirect',
      //   paymentMethodId: _paymentMethod.id,
      // ));
      print('PP token: ${_token}');
      await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: _secKey,
          returnURL: 'example://stripe-redirect',
          paymentMethodId: _token.tokenId,
          paymentMethod: PaymentMethodRequest(card: _testCard, token: _token)));
      setState(() {
        _isLoading = false;
      });
    }
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
    //   return Payment(TicketModal(
    //     passengerName: nameControler.text,
    //     passengerEmail: FirebaseAuth.instance.currentUser.email,
    //     passengerNumber: phoneNumberControler.text,
    //     busName: widget.chosenBus.busName,
    //     busNumber: widget.chosenBus.busNo,
    //     date: widget.chosenDate,
    //     totalSeats: int.parse(widget.numberOfSeats),
    //     totalSeatsCost: widget.chosenBus.routes[0].costPerSeat,
    //     from: widget.chosenBus.routes[0].from,
    //     fromTime: widget.chosenBus.routes[0].fromTime,
    //     to: widget.chosenBus.routes[0].to,
    //   ));
    // }));
  }

  bool _isLoading = false;
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
            SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: _isLoading ? () {} : _startPayment,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator())
                        : Text(
                            'Pay ${_totalAmount} with Card',
                            style: TextStyle(
                              color: Colors.white,
                              // fontSize: 22,
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
