import 'package:client/data/model/userModel.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'http://localhost:3000/admin/';
    _dio.options.followRedirects = true;
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
    _dio.options.validateStatus = (status) {
      // Allow redirection (300 status codes) to be handled without throwing exceptions
      return status != null && status < 415;
    };
  }

  Future<dynamic> signInUser(userModel data) async {
    try {
      // Send POST request
      Response response = await _dio.post('/sign-in', data: data);

      return response; // Return general error message if no response details are available
    } catch (err) {
      return err;
    }
  }

  Future<dynamic> signUpUser(userModel data) async {
    try {
      // Send POST request
      Response response = await _dio.post('/sign-up', data: data);

      return response; // Return general error message if no response details are available
    } catch (err) {
      return err;
    }
  }
}
