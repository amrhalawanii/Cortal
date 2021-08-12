class Complaint {
  final String id;
  final String senderId;
  final String title;
  final String dateTime;
  final String status;
  final String description;
  final List<dynamic> types;

  Complaint(
    this.id,
    this.senderId,
    this.title,
    this.dateTime,
    this.status,
    this.description,
    this.types,
  );
}
