class StudentModel {
  final int? studentId;
  final String name;
  final int? batchId;

  StudentModel({
    this.studentId,
    required this.name,
    this.batchId,
  });

  // Factory constructor to create a StudentModel from a map
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      studentId: map['student_id'] as int?, // Explicitly cast to int?
      name: map['name'] as String,
      batchId: map['batch_id'] as int?, // Explicitly cast to int?
    );
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      studentId: json['student_id'],
      name: json['name'],
      batchId: json['batch_id'],
    );
  }

  // Method to convert StudentModel to a map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'student_id': studentId,
      'name': name,
      'batch_id': batchId,
    };
  }

  // Static method to create a list of StudentModel from a list of maps
  static List<StudentModel> fromJsonList(List<Map<String, dynamic>> maps) {
    return maps.map((map) => StudentModel.fromMap(map)).toList();
  }
}
