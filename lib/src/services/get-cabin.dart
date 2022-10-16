import 'dart:convert';

import '../models/cabin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchCabin(uri) async {
  final getToken = await SharedPreferences.getInstance();
  final jwt = await getToken.getString('token');
  final resp = await http.get(
    Uri.parse("$uri/cabins/"),
    headers: {
      'Authorization': 'Bearer $jwt',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  if (resp.statusCode == 200) {
    print(jsonDecode(resp.body)[0]);
    // return Cabin.fromJson(jsonDecode(resp.body)[0]);
    return jsonDecode(resp.body);
  } else {
    print(resp.body);
    throw Exception('Failed to get cabins');
  }
}
