import 'package:client/domain/entities/studentsEntities.dart';

abstract class StudentsRepo {
  Future<List<StudentsEntities>> getStudentsList();
  Future<void> addStudents();
  Future<void> deleteStudents();
  Future<void> updateStudents();
}
