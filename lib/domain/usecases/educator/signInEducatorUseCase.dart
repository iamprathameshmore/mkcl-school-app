import 'package:client/domain/entities/educatorEntities.dart';
import 'package:client/domain/failure/educatorFailure.dart';
import 'package:client/domain/repositories/educatorRepo.dart';
import 'package:dartz/dartz.dart';

class SignInEducatorUsecase {
  final EducatorRepo repository;

  SignInEducatorUsecase(this.repository);

  Future<Future<Either<EducatorFailure, Educatorentities>>> call(
      String name, String email, String password) async {
    return repository.signInEducator(name, email);
  }
}
