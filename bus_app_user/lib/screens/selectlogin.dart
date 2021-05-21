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
                        child: Card(
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.red,
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            child: Text(
                              'CREATE AN ACCOUNT',
                              style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                      child: Card(
                        shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.blue[800],
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 110, vertical: 15),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
