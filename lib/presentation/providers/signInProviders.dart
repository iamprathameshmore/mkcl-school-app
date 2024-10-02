import 'package:flutter_riverpod/flutter_riverpod.dart';

// This is a mock function simulating an asynchronous operation.
Future<String> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  return "Hello, Prathamesh!";
}

// Define a FutureProvider to provide data asynchronously
final userDataProvider = FutureProvider<String>((ref) async {
  return fetchUserData();
});
