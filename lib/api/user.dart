import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:laundryapp/api/link.dart';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';

Future<Object> loginRequest({String username, String password}) async {
  final body = {'username': username, 'password': password};

  // var uri = Uri.http(API_PREFIX, login_api, queryParameter); sending with query

  http.Response response =
      await http.post(login_api, body: json.encode(body), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });
  var session = FlutterSession();

  Map<String, dynamic> jsonMap = json.decode(response.body);

  if (jsonMap["succes"]) {
    print(jsonMap);
    String myJWTToken = jsonMap["token"];

    await session.set("token", myJWTToken);
  }

  return jsonMap;
}

Future<Object> whoImIRequest() async {
  // Future response = http.get('https://jsonplaceholder.typicode.com/albums/1');
  var session = FlutterSession();
  dynamic token = await session.get("token");
  print(token);
  print("whoimi");
  http.Response response = await http.get(whoimi_api, headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token'
  });

  Map<dynamic, dynamic> jsonMap = json.decode(response.body);
  print(jsonMap);

  return jsonMap;
}

Future<Object> registerRequest(
    {String username,
    String password,
    String name,
    String email,
    String phone}) async {
  final body = {
    'username': username,
    'password': password,
    'name': name,
    'email': email,
    'phone': phone
  };

  print(body);

  // var uri = Uri.http(API_PREFIX, login_api, queryParameter); sending with query
  http.Response response =
      await http.post(register_api, body: json.encode(body), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  Map<String, dynamic> jsonMap = json.decode(response.body);

  if (jsonMap["succes"]) {
    print(jsonMap);
  }

  return jsonMap;
}

void doLogout() async {
  var session = FlutterSession();
  session.set("token", '');
}
