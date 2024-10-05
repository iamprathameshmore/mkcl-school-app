import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a StateNotifier to manage loading state
class LoadingStateNotifier extends StateNotifier<bool> {
  LoadingStateNotifier() : super(false);

  void startLoading() => state = true;
  void stopLoading() => state = false;
}

// Create a provider for the LoadingStateNotifier
final loadingProvider =
    StateNotifierProvider<LoadingStateNotifier, bool>((ref) {
  return LoadingStateNotifier();
});
