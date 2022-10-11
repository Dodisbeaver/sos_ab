import 'dart:convert';

class Cabin {
  final String cabin;
  final String size;
  final String address;
  final double rent;
  const Cabin({
    required this.cabin,
    required this.address,
    required this.rent,
    required this.size,
  });

  factory Cabin.fromJson(Map<String, dynamic> json) {
    return Cabin(
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
