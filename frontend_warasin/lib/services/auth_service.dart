import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warasin/models/user_model.dart';

class AuthService {
  final String baseUrl = 'http://localhost:8080';

  Future<UserModel> register({
    String? nama,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'nama': nama,
      'email': email,
      'password': password,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data != null) {
        UserModel user = UserModel.fromJson(data);
        return user;
      } else {
        throw Exception('Response data is null');
      }
    } else {
      print('Register Failed - Status Code: ${response.statusCode}');
      print('Error Message: ${response.body}');
      throw Exception('Register Failed');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data != null) {
        UserModel user = UserModel.fromJson(data);
        return user;
      } else {
        throw Exception('Response data is null');
      }
    } else {
      print('Login Failed - Status Code: ${response.statusCode}');
      print('Error Message: ${response.body}');
      throw Exception('Login Failed');
    }
  }
}
