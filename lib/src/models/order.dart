import 'dart:convert';
// import 'dart:html';

import 'package:sos_ab/src/models/cabin.dart';
import 'package:sos_ab/src/models/service.dart';
import 'order_library.dart';

class Order {
  final int id;
  final String cabinId;
  final String serviceType;
  final String serviceTime;
  // final service = <Service>[];
  // final DateTime serviceTime = DateTime.now();

  Order({
    required this.id,
    required this.cabinId,
    required this.serviceType,
    required this.serviceTime,
  });

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
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: ordersInstances.allOrders.length,
      cabinId: json['cabinId'],
      serviceType: json['serviceType'],
      serviceTime: json['serviceTime'],
    );
  }
  Map<String, dynamic> toJson() => {
        "cabinId": cabinId,
        "serviceType": serviceType,
        "serviceTime": serviceTime,
      };
}
