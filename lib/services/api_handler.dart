import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class APIHandler {
  String getUrl = 'https://reqres.in/api/users?page=2';
  Future get() async {
    var client = http.Client();
    http.Response response = await client.get(Uri.parse(getUrl));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("error");
      throw "network error";
    }
  }
}
