import 'dart:convert';

import 'package:sos_ab/src/models/cabin.dart';
import 'package:sos_ab/src/models/service.dart';

class Order {
  final int id;
  final Cabin cabin;
  final service = <Service>[];
  final DateTime serviceTime = DateTime.now();

  Order(
    this.id,
    this.cabin,
  );

  // factory Order.fromJson(Map<String, dynamic> json) {
  //   return Order(
  //     cabin: json['cabin'],
  //     serviceType: json['size'],
  //     serviceTime: json['address'],
  //     createdBy: json['rent'],
  //   );
  // }
  // Map<String, dynamic> toJson() => {
  //       "cabin": cabin,
  //       "size": serviceType,
  //       "address": serviceTime,
  //       "rent": createdBy,
  //     };
}
