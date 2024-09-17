import 'package:client/domain/entities/educatorEntities.dart';
import 'package:client/domain/failure/educatorFailure.dart';
import 'package:dartz/dartz.dart';

abstract class EducatorRepo {
  Future<Either<EducatorFailure, Educatorentities>> signInEducator(
      String email, String password);
  Future<Either<EducatorFailure, Educatorentities>> signUpEducator(
      String name, String email);
}
