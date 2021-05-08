import 'dart:ffi';

class RouteModel {
  final String from;
  final String to;
  final DateTime fromTime;
  final DateTime toTime;
  final double costPerSeat;

  RouteModel({
    this.fromTime,
    this.toTime,
    this.from,
    this.to,
    this.costPerSeat,
  });
}
