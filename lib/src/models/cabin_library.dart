import 'cabin.dart';
import 'order.dart';
import 'service.dart';
import '../services/get-cabin.dart';

final orderInstance = CabinServices()
  ..addCabin(
      cabinName: "Stugan 1",
      address: "välkommenvägen 1",
      rent: 1000,
      size: "big")
  ..addCabin(
      cabinName: "Stugan 2",
      address: "välkomin 2",
      rent: 1200,
      size: "Gigantisk");

class CabinServices {
  final List<Cabin> allCabins = [];
  final List<Order> allOrders = [];
  final List<Service> allServices = [];

  void addCabin({
    required String cabinName,
    required String size,
    required String address,
    required int rent,
  }) {
    // var order = allOrders.firstWhere(
    //   (orde) => orde.cabin == cabinName,
    //   orElse: () {
    //     final value = Order(allOrders.length, cabinName);
    //     allOrders.add(value);
    //     return value;
    //   },
    // );
    var cabin = Cabin(allCabins.length, cabinName, address, rent, size);
    // var service = Service(allServices.length, serviceType);

    order.service.add(service);
    allCabins.add(cabin);
  }
}
