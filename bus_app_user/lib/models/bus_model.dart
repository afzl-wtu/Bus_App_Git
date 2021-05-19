import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ticket_bus/models/route_model.dart';

class BusModel {
  final String busName;
  final String busNo;
  final List<RouteModel> routes;
  final String busCondition;
  final int totalSeats;
  BusModel({
    this.routes,
    this.totalSeats,
    this.busName,
    this.busNo,
    this.busCondition,
  });
  static List<BusModel> toList(
      QuerySnapshot<Map<String, dynamic>> firebaseresponse) {
    final response = firebaseresponse.docs.map((e) => e.data()).toList();
    return response
        .map((e) => BusModel(
            busName: e['busName'],
            busNo: e['busNumber'],
            busCondition: e['busCondition'],
            totalSeats: int.parse(e['totalNumberOfSeats']),
            routes: (e['busRoutes'] as List)
                .map(
                  (e) => RouteModel(
                    from: e['from'],
                    to: e['to'],
                    fromTime: e['fromTime'],
                    toTime: e['toTime'],
                    costPerSeat: e['costPerSeat'],
                  ),
                )
                .toList()))
        .toList();
  }
}
