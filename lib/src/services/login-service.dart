import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_ab/src/services/save-service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var serverIP = 'https://schoolproject2.azurewebsites.net/';
const bool isLogged = false;

Future attemptLogIn(String username, String password) async {
  print("in Future Attemptlog");
  // final msg = jsonEncode({"email": username, "password": password});
  var res = await http.post(Uri.parse("$serverIP/users/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": username, "password": password}));
  if (res.statusCode == 200) {
    saveToken(jsonDecode(res.body)['token']);
    return true;
  }
  return false;
}

Future isLoggedIn() async {
  return isLogged;
}
