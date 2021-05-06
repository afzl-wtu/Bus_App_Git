import 'package:ticket_bus/models/route_model.dart';
import 'package:ticket_bus/models/seat_model.dart';

class BusModel {
  final String busImage;
  final String busname;
  final String busNo;
  final List<RouteModel> routes;
  final double costPerSeat;
  final String busCondition;
  final List<SeatModel> seats;
  BusModel({
    this.routes,
    this.costPerSeat,
    this.seats,
    this.busImage,
    this.busname,
    this.busNo,
    this.busCondition,
  });
}
