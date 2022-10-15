import 'dart:convert';

class Cabin {
  final int id;
  final String cabin;
  final String size;
  final String address;
  final int rent;

  Cabin(
    this.id,
    this.cabin,
    this.address,
    this.rent,
    this.size,
  );

  // factory Cabin.fromJson(Map<String, dynamic> json) {
  //   return Cabin(
  //     cabin: json['cabin'],
  //     size: json['size'],
  //     address: json['address'],
  //     rent: json['rent'],
  //   );
  // }
  // Map<String, dynamic> toJson() => {
  //       "cabin": cabin,
  //       "size": size,
  //       "address": address,
  //       "rent": rent,
  // };
}
