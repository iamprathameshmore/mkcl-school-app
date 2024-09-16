import 'package:client/data/datasources/remote/educatorApi.dart';
import 'package:client/domain/entities/educatorEntities.dart';
import 'package:client/domain/repositories/educatorRepo.dart';

class EducatorEepoData implements EducatorRepoInterface {
  final EducatorRemoteDataSource remoteDataSource;

  EducatorEepoData({
    required this.remoteDataSource,
  });

  @override
  Future<Educatorentities> signUpEducator(String name, String email) {
    // TODO: implement signUpEducator
    throw UnimplementedError();
  }

  @override
  Future<Educatorentities?> signInEducator(
      String email, String password) async {
    final user = await remoteDataSource.signIn(email, password);
    if (user != null) {
      // await localDataSource.cacheUserToken(user.id); // Example: caching user ID or token
      return Educatorentities(email: user.email, name: user.name);
    }
    return null;
  }
}
