// import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future saveToken(String token) async {
  final saveToken = await SharedPreferences.getInstance();
  await saveToken.setString('token', token);
  // print(saveToken.getString('token'));
  return saveToken;
}
