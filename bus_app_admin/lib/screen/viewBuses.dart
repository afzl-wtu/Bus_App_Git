import 'package:bus_tick/models/bus_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewBuses extends StatelessWidget {
  final busesRef = FirebaseFirestore.instance.collection('buses');
  List<BusModel> _buses;
  Future<void> _getData() async {
    final _response = await busesRef.get();
    _buses = BusModel.toList(_response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('View Buses'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (_, snap) => snap.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (_, i) => ExpansionTile(
                      leading: CircleAvatar(
                        child: Text((i + 1).toString()),
                      ),
                      title: Text(_buses[i].busName),
                      subtitle: Text(_buses[i].busNo),
                      children: _buses[i]
                          .routes
                          .map((e) => Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('From: ${e.from}'),
                                            Spacer(),
                                            Text('Time: ${e.fromTime}'),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text('Destination: ${e.to}'),
                                            Spacer(),
                                            Text('Time: ${e.toTime}')
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text('Cost Per Seat: ${e.costPerSeat}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                separatorBuilder: (_, i) => Divider(thickness: 1),
                itemCount: _buses.length),
      ),
    );
  }
}
