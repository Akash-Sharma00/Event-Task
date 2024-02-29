class EventModel {
  final String date;
  final String? image;
  final String title;
  final String startTime;
  final String endTime;
  final String des;

  EventModel(
      {required this.date,
      required this.des,
       this.image,
      required this.title,
      required this.startTime,
      required this.endTime});
}
