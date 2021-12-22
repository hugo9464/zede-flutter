import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zede_app/models/User.dart';

class UserService {
  static final url = Uri.parse('http://localhost:3000/api/user/login');

  static Future<User> signIn({
    required String email,
    required String password,
  }) async {
    final response =
        await http.post(url, body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(response.body);
      final user = User.fromJson(jsonDecode(response.body));

      const storage = FlutterSecureStorage();
      await storage.write(key: "token", value: user.token);

      return user;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
