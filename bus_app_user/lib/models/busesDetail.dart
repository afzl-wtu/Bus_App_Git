import 'package:ticket_bus/models/seat_model.dart';

class BusesDetail {
  final String busImage;
  final String busname;
  final String busNo;
  final String journeyDate;
  final String from;
  final String to;
  final String time;
  final String busCondition;
  final List<SeatModel> seats;
  BusesDetail({
    this.seats,
    this.busImage,
    this.busname,
    this.busNo,
    this.journeyDate,
    this.from,
    this.to,
    this.time,
    this.busCondition,
  });
}

List<BusesDetail> busDetail = [
  BusesDetail(
    busImage: 'assets/images/bus4.jpg',
    busname: 'Afzal Travells',
    busNo: 'Al4678',
    journeyDate: '12-09-2021',
    from: 'Bahawalnagar',
    to: 'Islambad',
    time: '10:00 pm',
    busCondition: 'A/C',
  ),
  BusesDetail(
    busImage: 'assets/images/bus5.jpg',
    busname: 'Tasadduq Travells',
    busNo: 'Al4678',
    journeyDate: '12-09-2021',
    from: 'Bahawalnagar',
    to: 'Islambad',
    time: '10:00 pm',
    busCondition: 'Non A/C',
  ),
  BusesDetail(
    busImage: 'assets/images/bus6.jpg',
    busname: 'Waqas Travells',
    busNo: 'Al4678',
    journeyDate: '12-09-2021',
    from: 'Bahawalnagar',
    to: 'Islambad',
    time: '10:00 pm',
    busCondition: 'A/C',
  ),
  BusesDetail(
    busImage: 'assets/images/bus7.jpg',
    busname: 'Afzal Travells',
    busNo: 'Al4678',
    journeyDate: '12-09-2021',
    from: 'Bahawalnagar',
    to: 'Islambad',
    time: '10:00 pm',
    busCondition: 'A/C',
  ),
  BusesDetail(
    busImage: 'assets/images/bus8.png',
    busname: 'Waqas Travells',
    busNo: 'Al4678',
    journeyDate: '12-09-2021',
    from: 'Bahawalnagar',
    to: 'Islambad',
    time: '10:00 pm',
    busCondition: 'Non A/C',
  ),
];
