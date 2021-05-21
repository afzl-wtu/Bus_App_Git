import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> _login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailControler.text,
      password: passwordControler.text,
    );
    Navigator.pop(context);
  }

  bool checkBoxValue = true;
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sign In Account',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: mediaQuery.size.height,
        width: mediaQuery.size.height,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.size.height * 1 / 8,
                    left: mediaQuery.size.width * 1 / 15,
                    right: mediaQuery.size.width * 1 / 15,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    elevation: 10,
                    child: TextField(
                      controller: emailControler,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(Icons.mail_outline),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.size.height * 1 / 50,
                    left: mediaQuery.size.width * 1 / 15,
                    right: mediaQuery.size.width * 1 / 15,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: TextField(
                      controller: passwordControler,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //     top: mediaQuery.size.height * 1 / 50,
                //   ),
                // ),
                SizedBox(height: 20),
                ListTile(
                  // tileColor: Colors.teal,
                  title: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: checkBoxValue,
                            activeColor: Colors.blue,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxValue = newValue;
                              });
                            }),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Text(
                    'Forgotten Password?',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.size.height * 1 / 22,
                  ),
                ),
                InkWell(
                  onTap: _login,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.red,
                    elevation: 10,
                    shadowColor: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      child: Text(
                        'SIGN IN ACCOUNT',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: 50,
                //     width: mediaQuery.size.width * 1 / 1.2,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Or Sign In With',
                //         style: TextStyle(
                //           color: Colors.black54,
                //           fontSize: 17.0,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Text(
                    //       ' Google',
                    //       style: TextStyle(color: Colors.blue, fontSize: 16),
                    //     ),
                    //     Text(
                    //       ' Facebook',
                    //       style: TextStyle(color: Colors.blue, fontSize: 16),
                    //     ),
                    //     Text(
                    //       ' Twitter',
                    //       style: TextStyle(color: Colors.blue, fontSize: 16),
                    //     )
                    //   ],
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Signup(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: FittedBox(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'If you have no any account? ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                                Card(
                                  color: Colors.blue,
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'SIGN UP ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
