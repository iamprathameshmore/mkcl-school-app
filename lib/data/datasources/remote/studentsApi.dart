import 'dart:convert';
import 'package:client/data/models/educatorModel.dart';
import 'package:http/http.dart' as http;

class StudentsApi {
  final String apiUrl = 'https://example.com/api/user';

  Future<bool> postUser(Educatormodel user) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
