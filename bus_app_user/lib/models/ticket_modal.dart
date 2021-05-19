class TicketModal {
  final String passengerName;
  final String passengerEmail;
  final String passengerNumber;
  final int passengerAge;
  final String busNumber;
  final String busName;
  final String from;
  final String fromTime;
  final String to;
  final DateTime date;
  final int totalSeats;
  final double totalSeatsCost;

  TicketModal({
    this.passengerName,
    this.passengerEmail,
    this.passengerNumber,
    this.passengerAge,
    this.busNumber,
    this.busName,
    this.from,
    this.fromTime,
    this.to,
    this.date,
    this.totalSeats,
    this.totalSeatsCost,
  });
}
