class AttendanceModel {
  final int? attendanceId;
  final int studentId;
  final int batchId; // Add this field
  final String attendanceDate;
  final String status;

  AttendanceModel({
    this.attendanceId,
    required this.studentId,
    required this.batchId, // Include in constructor
    required this.attendanceDate,
    required this.status,
  });

  // Convert a AttendanceModel into a Map. The Map is used as an intermediate step when converting to JSON.
  Map<String, dynamic> toJson() {
    return {
      'attendance_id': attendanceId,
      'student_id': studentId,
      'batch_id': batchId, // Include in JSON
      'attendance_date': attendanceDate,
      'status': status,
    };
  }

  // Convert a Map into a AttendanceModel. This is the reverse of the `toJson` method.
  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      attendanceId: json['attendance_id'],
      studentId: json['student_id'],
      batchId: json['batch_id'], // Include in the factory constructor
      attendanceDate: json['attendance_date'],
      status: json['status'],
    );
  }
}
