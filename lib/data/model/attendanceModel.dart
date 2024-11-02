class AttendanceModel {
  final int? attendanceId; // Optional ID for existing attendance records
  final int studentId; // ID of the student
  final String attendanceDate; // Date of the attendance
  final String
      status; // Status of the attendance (e.g., Present, Absent, Late, Excused)

  AttendanceModel({
    this.attendanceId,
    required this.studentId,
    required this.attendanceDate,
    required this.status,
  });

  // Convert an AttendanceModel instance to a Map for storing in the database
  Map<String, dynamic> toJson() {
    return {
      'attendance_id': attendanceId,
      'student_id': studentId,
      'attendance_date': attendanceDate,
      'status': status,
    };
  }

  // Create an AttendanceModel instance from a Map (retrieved from the database)
  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      attendanceId: json['attendance_id'], // Deserialize attendance_id
      studentId: json['student_id'], // Deserialize student_id
      attendanceDate: json['attendance_date'], // Deserialize attendance_date
      status: json['status'], // Deserialize status
    );
  }
}
