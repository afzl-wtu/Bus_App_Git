import 'package:flutter/material.dart';

import 'dart:async';

import './onboardind.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    return new Timer(Duration(milliseconds: 2000), navigatorPage);
  }

  void navigatorPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => OnBoarding(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.3),
                Color.fromRGBO(0, 0, 0, 0.4)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    Text(
                      "Book your bus ticket",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                      ),
                    ),
                    Hero(
                      tag: "tsdq",
                      child: Text(
                        "Bus Ticket",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 35.0,
                          letterSpacing: 0.8,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
