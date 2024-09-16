import 'package:client/domain/entities/educatorEntities.dart';
import 'package:client/domain/repositories/educatorRepo.dart';

class SignInEducatorUsecase {
  final EducatorRepoInterface repository;

  SignInEducatorUsecase(this.repository);

  Future<Educatorentities?> call(
      String name, String email, String password) async {
    return repository.signInEducator(name, email);
  }
}
