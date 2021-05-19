import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './contactUs.dart';
import './profile.dart';
import './ticket.dart';
import '../screens/home.dart';
import './notification.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue.shade800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    Text(
                      'DoL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton.icon(
                label: Text(
                  'Profile',
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade50),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return ProfileSCreen();
                  }));
                },
              ),
              Divider(thickness: 1),
              ElevatedButton.icon(
                label: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.contact_phone,
                  color: Colors.black,
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade50),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return ContactUs();
                  }));
                },
              ),
              Divider(thickness: 1),
              ElevatedButton.icon(
                label: Text(
                  'My Ticket',
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.book,
                  color: Colors.black,
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade50),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return Ticket();
                  }));
                },
              ),
              Divider(thickness: 1),
              ElevatedButton.icon(
                label: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade50),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
              Divider(thickness: 1),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                child: Icon(Icons.home),
              ),
              Tab(
                child: Icon(Icons.notification_important),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Home(),
            Notifications(),
          ],
        ),
      ),
    );
  }
}
