import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:laundryapp/api/link.dart';
import 'dart:convert';

Future<Object> getAllServicesRequest() async {
  print("getting services");
  http.Response response = await http.get(get_all_services_api, headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  Map<String, dynamic> jsonMap = json.decode(response.body);

  return jsonMap;
}
