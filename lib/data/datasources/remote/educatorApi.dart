import 'package:client/core/constant/apiConstant.dart';
import 'package:client/data/models/educatorModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EducatorRemoteDataSource {
  final String apiUrl = educatorApiUrl;

  Future<Educatormodel?> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/signin/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return Educatormodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign in');
    }
  }

  Future<Educatormodel?> signUp(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/signup/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
      }),
    );

    if (response.statusCode == 200) {
      return Educatormodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
