import 'package:flutter/material.dart';

import '../models/seat_model.dart';
import './contactPassenger.dart';

// ignore: must_be_immutable
class SelectSeats extends StatelessWidget {
  List<SeatModel> seats = List.generate(
    45,
    (index) => SeatModel(
      seatNo: index + 1,
      seatImage: 'assets/images/bus Seat.png',
    ),
  );
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your Seats'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSeats('Available', 'assets/images/bus Seat.png', devSize,
                  Colors.black),
              buildSeats('Male', 'assets/images/bus Seat.png', devSize,
                  Colors.blue.shade800),
              buildSeats(
                  'Female', 'assets/images/bus Seat.png', devSize, Colors.pink),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.builder(
              itemCount: 11,
              itemBuilder: (_, i) => buildCircleAvatarsRow(i),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Seats',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '3',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Costs',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rs.4500.00',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return ContactPassenger();
              }));
            },
            child: Container(
              width: double.infinity,
              height: 48,
              margin: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 10),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCircleAvatarsRow(int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 35, right: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCircleAvatar(i * 4),
          buildCircleAvatar(i * 4 + 1),
          (i < 10) ? Spacer() : buildCircleAvatar(i * 4 + 2),
          buildCircleAvatar(i * 4 + (i < 10 ? 2 : 3)),
          buildCircleAvatar(i * 4 + (i < 10 ? 3 : 4))
        ],
      ),
    );
  }

  Widget buildCircleAvatar(int i) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: seats[i].seatStatus == SeatStatus.Available
            ? Colors.black
            : seats[i].seatStatus == SeatStatus.Male
                ? Colors.blue
                : Colors.pink,
        child: Text(seats[i].seatNo.toString()),
      ),
    );
  }
}

// ignore: missing_return
Widget buildSeats(String text, String image, Size devSize, Color color) {
  return Container(
    height: 50,
    width: devSize.width / 4.2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
            child: Text(
          text,
          style: TextStyle(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.bold,
          ),
        )),
        Image.asset(
          image,
          height: 28,
          color: color,
        ),
      ],
    ),
  );
}

Widget buildBusSeats(String image) {
  return Padding(
    padding: EdgeInsets.only(
      left: 60,
      top: 10,
    ),
    child: Row(
      children: [
        Image.asset(image, height: 35),
        SizedBox(width: 5),
        Image.asset(image, height: 35),
        SizedBox(width: 80),
        Image.asset(image, height: 35),
        SizedBox(width: 5),
        Image.asset(image, height: 35),
        SizedBox(width: 5),
        Image.asset(image, height: 35),
      ],
    ),
  );
}
