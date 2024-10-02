import 'package:client/data/datasources/remote/educatorApi.dart';
import 'package:client/domain/entities/educatorEntities.dart';
import 'package:client/domain/failure/educatorFailure.dart';
import 'package:client/domain/repositories/educatorRepo.dart';

import 'package:dartz/dartz.dart';

class EducatorRepoImpl implements EducatorRepo {
  final EducatorRemoteDataSource remoteDataSource;

  EducatorRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<EducatorFailure, Educatorentities>> signInEducator(
      String email, String password) {
    // TODO: implement signInEducator
    throw UnimplementedError();
  }

  @override
  Future<Either<EducatorFailure, Educatorentities>> signUpEducator(
      String name, String email) {
    // TODO: implement signUpEducator
    throw UnimplementedError();
  }
}
