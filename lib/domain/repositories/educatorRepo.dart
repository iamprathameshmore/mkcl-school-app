import 'package:client/domain/entities/educatorEntities.dart';

abstract class EducatorRepoInterface {
  Future<Educatorentities?> signInEducator(String email, String password);
  Future<Educatorentities?> signUpEducator(String name, String email);
}
