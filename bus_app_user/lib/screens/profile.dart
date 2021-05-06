import 'package:flutter/material.dart';

class ProfileSCreen extends StatefulWidget {
  @override
  _ProfileSCreenState createState() => _ProfileSCreenState();
}

class _ProfileSCreenState extends State<ProfileSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(children: [
                CircleAvatar(
                  radius: 77,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.indigo,
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.camera),
                      onPressed: () {},
                    ),
                  ),
                )
              ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      'Chief Tasadduq W2',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Adress',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      'Tehsil & District Bahawalnagar',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      '0306-00000000',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      'tasadaq.wtu@gmail.com',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade800)),
              onPressed: () {},
              child: Text(
                'Update Profile',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
