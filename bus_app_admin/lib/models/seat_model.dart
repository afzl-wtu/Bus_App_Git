enum SeatStatus { Available, Male, Female }

class SeatModel {
  final int seatNo;
  final String seatImage;
  SeatStatus seatStatus;

  SeatModel({
    this.seatNo,
    this.seatImage,
    this.seatStatus = SeatStatus.Available,
  });
}
