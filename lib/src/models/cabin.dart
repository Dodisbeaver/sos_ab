import 'dart:convert';
import 'package:sos_ab/src/data.dart';

import 'order.dart';

class Cabin {
  final int id;
  final String cabin;
  final String size;
  final String address;
  final int rent;

  Cabin({
    required this.id,
    required this.cabin,
    required this.size,
    required this.address,
    required this.rent,
  });

  // factory Cabin.fromJson(dynamic json) {
  //   return Cabin(json['cabinId'] as String, json['cabin'] as String,
  //       json['size'] as String, json['address'] as String, json['rent'] as int);
  // }
  //TODO:
  //Kan möjigtvis fås id genom att ta längden av cabinList.
  //måste importera
  factory Cabin.fromJson(Map<String, dynamic> json) {
    return Cabin(
      id: cabinsInstances.allCabins.length,
      cabin: json['cabin'],
      size: json['size'],
      address: json['address'],
      rent: json['rent'],
    );
  }
  Map<String, dynamic> toJson() => {
        "cabin": cabin,
        "size": size,
        "address": address,
        "rent": rent,
      };
}
