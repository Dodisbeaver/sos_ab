import 'dart:convert';

import 'package:sos_ab/src/models/order.dart';
import 'package:sos_ab/src/widgets/cabin_list.dart';

import '../models/cabin.dart';
import '../models/order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchOrders(uri) async {
  final getToken = await SharedPreferences.getInstance();
  final jwt = await getToken.getString('token');
  final resp = await http.get(
    Uri.parse("$uri/orders/"),
    headers: {
      // 'Authorization': 'Bearer $jwt',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MzMyYWUwNzkyNWYzODI1NTdlYTAyZTgiLCJlbWFpbCI6ImpvaG4uZG9lQGFyY2FkYS5maSIsImlhdCI6MTY2NTkxMDYyMCwiZXhwIjoxNjY1OTk3MDIwfQ.oU6nrIbecDoZIZYmX-q4Vuy5uJnx8H_-KZ57FK4zK34',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  if (resp.statusCode == 200) {
    print(jsonDecode(resp.body)[0]);
    // return Cabin.fromJson(jsonDecode(resp.body)[0]);
    List<dynamic> body = jsonDecode(resp.body);

    return jsonDecode(resp.body);
  } else {
    print(resp.body);
    throw Exception('Failed to get cabins');
  }
}
