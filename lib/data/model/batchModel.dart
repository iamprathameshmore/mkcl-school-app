class BatchModel {
  final int? sNo; // Using nullable int for auto-incremented primary key
  final String title;
  final String desc;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;

  BatchModel({
    this.sNo,
    required this.title,
    required this.desc,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });

  // Convert BatchModel object to map to store in SQLite
  Map<String, dynamic> toMap() {
    return {
      's_no': sNo,
      'title': title,
      'desc': desc,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  // Convert map from SQLite to BatchModel object
  factory BatchModel.fromMap(Map<String, dynamic> map) {
    return BatchModel(
      sNo: map['s_no'],
      title: map['title'],
      desc: map['desc'],
      startDate: map['start_date'],
      endDate: map['end_date'],
      startTime: map['start_time'],
      endTime: map['end_time'],
    );
  }
}
