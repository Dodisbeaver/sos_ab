import 'dart:convert';
import 'package:sos_ab/models/cabin.dart';

RoomsResponse roomsResponseFromJson(String str) =>
    RoomsResponse.fromJson(json.decode(str));

String roomsResponseToJson(RoomsResponse data) => json.encode(data.toJson());

class RoomsResponse {
  RoomsResponse({
    required this.msg,
    required this.cabins,
  });
  String msg;
  List<Cabin> cabins;

  factory RoomsResponse.fromJson(Map<String, dynamic> json) => RoomsResponse(
        msg: json['msg'],
        cabins: List<Cabin>.from(json["cabin"].map((x) => Cabin.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "cabin": List<dynamic>.from(cabins.map((x) => x.toJson())),
      };
}
