import 'package:client/domain/entities/educatorEntities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInProviders extends StateNotifier<AsyncValue<Educatorentities?>> {
  SignInProviders(super.state);
}
