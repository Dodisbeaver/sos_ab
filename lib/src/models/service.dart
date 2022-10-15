class Service {
  final int id;
  final String serviceType;
  final String cabin;

  const Service(
    this.id,
    this.serviceType,
    this.cabin,
  );

  // factory Service.fromJson(Map<String, dynamic> json) {
  //   return Service(
  //     serviceType: json['serviceType'],
  //     createdBy: json['createdBy'],
  //   );
  // }
  // Map<String, dynamic> toJson() => {
  //       "serviceType": serviceType,
  //       "createdBy": createdBy,
  //     };
}
