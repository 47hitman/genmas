import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class Services {
  Services._privateConstructor();
  String blackping = "https://gemmasapi.kapuyuaxdev.my.id";

  static final Services instance = Services._privateConstructor();

  Future<String?> loginApp(
    String username,
    String password,
  ) async {
    // Ensure the path does not have a leading slash
    Uri url = Uri.parse('$blackping/auth/login');

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      return jsonDecode(response.body)['token']; // Ensure it returns a String
    } else {
      if (kDebugMode) {
        print(blackping);
        print(response.statusCode);
        print(response.body);
      }
      return null;
    }
  }

  Future<String?> registerApp(
    String username,
    String password,
    String email,
    String firstName,
    String lastName,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$blackping/auth/register'),
    );

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });
    request.fields['info'] = jsonEncode({
      "username": username,
      "password": password,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "role": "STUDENT",
    });

    // Send request
    final http.StreamedResponse response = await request.send();

    // Handle response
    if (response.statusCode == 201) {
      final String responseString = await response.stream.bytesToString();
      if (kDebugMode) {
        print(responseString);
      }
      return jsonDecode(responseString)['message'];
    } else {
      if (kDebugMode) {
        print(blackping);
        print(response.statusCode);
        final String errorResponse = await response.stream.bytesToString();
        print(errorResponse);
      }
      return null;
    }
  }
}
