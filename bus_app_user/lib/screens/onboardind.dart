import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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
        title: Text('Book Your Online \nBus Ticket.',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 0,
            )),
        iconImagePath: 'assets/images/hole.jpg'),
    PageModel(
        color: const Color(0xFF006599),
        heroImagePath: 'assets/images/bus3.png',
        title: Text('Digital Bus \nManagement System',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 0,
            )),
        iconImagePath: 'assets/images/hole.jpg'),
    PageModel(
        color: const Color(0xFF5c1f6d),
        heroImagePath: 'assets/images/bell.png',
        title: Text('Through \nNotifications Keep \n Yourself Updated',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 0,
            )),
        iconImagePath: 'assets/images/hole.jpg'),
  ];
  User _currentUser;
  void initState() {
    _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null)
      Timer(Duration(seconds: 0), () {
        dispose();
        return Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => SelectLogin()));
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _currentUser != null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
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
                  onDoneButtonPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SelectLogin())),
                  onSkipButtonPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SelectLogin()))),
            ),
          );
  }
}
