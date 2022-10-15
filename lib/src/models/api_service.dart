import 'cabin.dart';
import 'order.dart';
import 'service.dart';
import '../services/get-cabin.dart';

final orderInstance = CabinServices()
  ..addCabin(
      cabinName: "Stugan 1",
      address: "välkommenvägen 1",
      createdBy: "john.doe@arcada.fi",
      serviceType: "Städning",
      serviceTime: DateTime.now(),
      rent: 1000,
      size: "big")
  ..addCabin(
      cabinName: "Stugan 2",
      address: "välkomin 2",
      createdBy: "john.doe@arcada.fi",
      serviceType: "Borstning",
      serviceTime: DateTime.now(),
      rent: 1200,
      size: "Gigantisk");

class CabinServices {
  final List<Cabin> allCabins = [];
  final List<Order> allOrders = [];
  final List<Service> allServices = [];

  void addCabin({
    required String cabinName,
    required String address,
    required String createdBy,
    required String serviceType,
    required DateTime serviceTime,
    required int rent,
    required String size,
  }) {
    var order = allOrders.firstWhere(
      (orde) => orde.cabin == cabinName,
      orElse: () {
        final value =
            Order(allOrders.length, cabinName, serviceTime, createdBy);
        allOrders.add(value);
        return value;
      },
    );
    var cabin = Cabin(allCabins.length, cabinName, address, rent, size, order);
    var service = Service(allServices.length, serviceType, cabinName);

    order.service.add(service);
    allCabins.add(cabin);
  }
}
