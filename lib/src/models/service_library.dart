import 'service.dart';

final serviceInstance = Services()
  ..addService(
    serviceType: "Städning",
  )
  ..addService(
    serviceType: "Skurning",
  );

class Services {
  final List<Service> allServices = [];

  void addService({
    required String serviceType,
  }) {
    var service = Service(allServices.length, serviceType);

    allServices.add(service);
  }
}
