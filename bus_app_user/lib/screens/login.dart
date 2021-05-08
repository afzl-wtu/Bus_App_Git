import 'package:flutter/material.dart';

import './tabscreen.dart';
import './signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkBoxValue = true;
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Sign In Account'),
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                        ),
                        border: OutlineInputBorder(),
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.lock),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.size.height * 1 / 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Checkbox(
                          value: checkBoxValue,
                          activeColor: Colors.blue,
                          onChanged: (bool newValue) {
                            setState(() {
                              checkBoxValue = newValue;
                            });
                          }),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Remember Me Forgot your password ?',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.size.height * 1 / 22,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 400),
                          transitionsBuilder:
                              (context, animation, animationTime, child) =>
                                  ScaleTransition(
                                    alignment: Alignment.center,
                                    scale: animation,
                                    child: child,
                                  ),
                          pageBuilder: (context, animation, animationTime) =>
                              HomeScreen()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.blue.shade800),
                        color: Colors.blue.shade800),
                    child: Center(
                      child: Text(
                        'SIGN IN ACCOUNT',
                        style: TextStyle(
                          color: Colors.white,
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'If you have no an account? ',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(
                                'SIGN UP ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
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
