import 'package:bus_tick/models/route_model.dart';

class BusModel {
  final String busname;
  final String busNo;
  final List<RouteModel> routes;
  final String busCondition;
  final int totalseats;
  BusModel({
    this.routes,
    this.totalseats,
    this.busname,
    this.busNo,
    this.busCondition,
  });
}
