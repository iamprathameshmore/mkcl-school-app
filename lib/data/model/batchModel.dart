class BatchModel {
  final int? sNo; // Using nullable int for auto-incremented primary key
  final String title;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;

  BatchModel({
    this.sNo,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });

  // Convert BatchModel object to map to store in SQLite
  Map<String, dynamic> toMap() {
    final map = {
      'title': title,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime,
    };

    if (sNo != null) {
      map['s_no'] = sNo.toString();
    }

    return map;
  }

  @override
  String toString() {
    return 'BatchModel(title: $title, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime)';
  }

  // Convert map from SQLite to BatchModel object
  factory BatchModel.fromMap(Map<String, dynamic> map) {
    return BatchModel(
      sNo: map['s_no'],
      title: map['title'],
      startDate: map['start_date'],
      endDate: map['end_date'],
      startTime: map['start_time'],
      endTime: map['end_time'],
    );
  }
}
