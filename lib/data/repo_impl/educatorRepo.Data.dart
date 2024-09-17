import 'package:client/data/datasources/remote/educatorApi.dart';
import 'package:client/domain/entities/educatorEntities.dart';
import 'package:client/domain/repositories/educatorRepo.dart';
import 'package:dartz/dartz.dart';

class EducatorRepoImpl implements EducatorRep0 {
  final EducatorRemoteDataSource remoteDataSource;

  EducatorRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Educatorentities> signUpEducator(String name, String email) {
    // TODO: implement signUpEducator
    throw UnimplementedError();
  }

  @override
  Future<Either<Educato>> signInEducator(String email, String password) async {
    final user = await remoteDataSource.signIn(email, password);
    if (user != null) {
      // await localDataSource.cacheUserToken(user.id); // Example: caching user ID or token
      return Educatorentities(email: user.email, name: user.name);
    }
    return null;
  }
}
