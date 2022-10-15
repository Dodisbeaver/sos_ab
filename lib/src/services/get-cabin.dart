import 'dart:convert';

import 'package:http/http.dart';
import 'package:sos_ab/src/models/cabin.dart';

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchCabin(uri) async {
  final resp = await http.get(Uri.parse(uri));

  if (resp.statusCode == 200) {
    return jsonDecode(resp.body);
  } else {
    throw Exception('Failed to get cabins');
  }
}
