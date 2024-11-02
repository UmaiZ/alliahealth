import 'dart:io';

import 'package:alliahealth/services/toast.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String BearerToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInVzZXJFbWFpbCI6ImRldkBhbGxpYXVrLmNvbSIsInVzZXJUeXBlIjoiY2xpZW50IiwiZW52IjoiZGV2IiwiaGFzaCI6Ikl6MFdUL3FLMWUiLCJpYXQiOjE3MzA1NDA5ODAsImV4cCI6MTczMDU0MTg4MH0.zP6Dn1NxAl6m69VYe_VG1qdhLrAsLRTmeeZUZznEKSA";

  getApi(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $BearerToken',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final body = response.body;
        final jsonBody = json.decode(body);
        return jsonBody;
      } else {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String errorMessage = responseBody['message'];
        showtoast(errorMessage);
      }
    } catch (e) {
      showtoast(e);
    }
  }

  postApi(String url, data) async {
    print(data);
    print(url);

    try {
      String jsondata = json.encode(data);
      final response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $BearerToken',
          },
          body: jsondata);
      print(response.statusCode);
      if (response.statusCode == 201) {
        final body = response.body;
        final jsonBody = json.decode(body);
        return jsonBody;
      } else {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String errorMessage = responseBody['message'];
        print(errorMessage);
      }
    } catch (e) {
      print(e);
    }
  }
}

class ApiUrls {
  static const String baseUrl = 'https://api-dev.allia.health';

  String getQuestions = '$baseUrl/api/client/self-report/question';
  String postQuestion = '$baseUrl/api/client/self-report/answer';
}
