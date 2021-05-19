import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticket_bus/screens/tabscreen.dart';

import './signup.dart';
import './login.dart';

class SelectLogin extends StatefulWidget {
  @override
  _SelectLoginState createState() => _SelectLoginState();
}

class _SelectLoginState extends State<SelectLogin> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, snap) => snap.data != null
          ? HomeScreen()
          : Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                height: mediaQuery.size.height,
                width: mediaQuery.size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: mediaQuery.size.height * 1 / 8),
                        child: Text(
                          ' Start By Creating An \n           Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 32.0,
                            letterSpacing: 0.4,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: mediaQuery.size.width * 1 / 4,
                        right: mediaQuery.size.width * 1 / 4,
                        bottom: mediaQuery.size.height * 1 / 10,
                      ),
                      child: Container(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),

                    Padding(
                      padding:
                          EdgeInsets.only(top: mediaQuery.size.height * 1 / 3),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => Signup(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Center(
                            child: Text(
                              'CREATE AN ACCOUNT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: RaisedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => AdminSide()),
                    //       );
                    //     },
                    //     child: Text('Admin'),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Login(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
