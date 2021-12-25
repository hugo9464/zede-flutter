import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:zede_app/models/Weighing.dart';

class WeighingService {
  static final url = Uri.parse('http://localhost:3000/api/weighing');

  static Future<void> saveWeighing(
      {required double weight,
      required int? type,
      required String userId}) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");

    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode({"weight": weight, "type": type}));

    if (response.statusCode == 201) {
      log(response.body);
      log("Weighing saved successfully");
    } else {
      throw Exception('Failed to save weighing album');
    }
  }

  static Future<List<Weighing>> getAllWeighings() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");

    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      log(response.body);
      log("Weighing saved successfully");

      final List weighingsAsJson = json.decode(response.body);

      return weighingsAsJson
          .map((weighing) => Weighing.fromJson(weighing))
          .toList();
    } else {
      throw Exception('Failed to save weighing album');
    }
  }
}
