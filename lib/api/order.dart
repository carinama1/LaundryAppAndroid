import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:laundryapp/api/link.dart';
import 'dart:convert';

Future<Object> createOrderRequest(
    {String username, String phone, String address, int orderType}) async {
  print('order request');
  print(orderType);
  final body = {
    "username": username,
    "phone": phone,
    "address": address,
    "orderType": orderType
  };
  http.Response response =
      await http.post(create_order_api, body: json.encode(body), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  Map<String, dynamic> jsonMap = json.decode(response.body);

  return jsonMap;
}

Future<Object> findOrderByOwnerRequest({String username}) async {
  print('findorderbyowenr');
  final queryParameters = {
    "username": username,
  };

  final uri = Uri.http(PAI_PREFIX_GET, get_order_by_owner, queryParameters);

  print('findorderbyowenr');
  print(uri);
  http.Response response = await http.get(uri);

  Map<String, dynamic> jsonMap = json.decode(response.body);

  return jsonMap;
}
