import 'dart:convert';

import 'package:http/http.dart';
import 'package:sos_ab/models/cabin.dart';

import 'package:http/http.dart' as http;

Future<Cabin> fetchCabin(uri) async {
  final resp = await http.get(Uri.parse(uri));

  if (resp.statusCode == 200) {
    return Cabin.fromJson(jsonDecode(resp.body));
  } else {
    throw Exception('Failed to get cabins');
  }
}
