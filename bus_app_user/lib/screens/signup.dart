import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool checkBoxValue = true;
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final confirmPasswordControler = TextEditingController();
  Future<void> _signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControler.text, password: passwordControler.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Create An Account'),
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
                      controller: emailControler,
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
                      controller: passwordControler,
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
                    left: mediaQuery.size.width * 1 / 15,
                    right: mediaQuery.size.width * 1 / 15,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: confirmPasswordControler,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.lock),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Confirm Password',
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
                            'By clicking sign up you agree to the\n following',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                        ),
                        Column(children: [
                          Row(
                            children: [
                              Text(
                                'Terms and Conditions',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                              ),
                              Text(
                                ' without reservation.',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              )
                            ],
                          ),
                        ])
                      ])
                    ],
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (ctx) => Login(),
                //       ),
                //     );
                //   },
                //   child: Text(
                //     'Have Acount? Sign in',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaQuery.size.height * 1 / 22,
                  ),
                ),
                InkWell(
                  onTap: _signup,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.blue.shade800),
                        color: Colors.blue.shade800),
                    child: Center(
                      child: Text(
                        'CREATE AN ACCOUNT',
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
                //       borderRadius: BorderRadius.circular(7),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Or Sign Up With',
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
                            builder: (ctx) => Login(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              Text(
                                'SIGN IN ',
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
