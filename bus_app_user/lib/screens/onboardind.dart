import 'package:flutter/material.dart';

import 'package:fancy_on_boarding/fancy_on_boarding.dart';

import './selectlogin.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnBoardingState createState() => new _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pageList = [
    PageModel(
        color: const Color(0xFF8acee1),
        heroImagePath: 'assets/images/booking.jpeg',
        title: Text('Book Your Online \n Bus Ticket',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('I am not superstitious,but i am a little stitious.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/png/key.png'),
    PageModel(
        color: const Color(0xFF006599),
        heroImagePath: 'assets/images/bus3.png',
        title: Text('Digital Bus \n Management System',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('I am not superstitious,but i am a little stitious.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/png/wallet.png'),
    PageModel(
      color: const Color(0xFF5c1f6d),
      heroImagePath: 'assets/images/bell.png',
      title: Text('Through \n Notifications Keep \n Yourself Updated',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('I am not superstitious,but i am a little stitious.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.amber,
            fontSize: 18.0,
          )),
      icon: Icon(
        Icons.notification_important,
        color: const Color(0xFF9B90BC),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.blue, Colors.indigo])),
      child: Scaffold(
        body: FancyOnBoarding(
            doneButtonText: "Get Started",
            skipButtonText: "Skip",
            doneButtonBackgroundColor: Colors.amber.shade900,
            pageList: pageList,
            onDoneButtonPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectLogin())),
            onSkipButtonPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectLogin()))),
      ),
    );
  }
}
