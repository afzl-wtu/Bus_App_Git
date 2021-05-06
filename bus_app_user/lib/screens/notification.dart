import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(
                title: Text('Ticketing 20% Off'),
                trailing: Text('1:45 PM'),
                leading: CircleAvatar(
                  child: Icon(Icons.notification_important),
                  backgroundColor: Colors.green,
                ),
                subtitle: Text(
                    'lorem ipsum dollar \n sit amet \n consectetutor \n adipicing elit sed'),
              ),
            );
          },
        ));
  }
}
