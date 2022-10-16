import 'cabin.dart';
import 'order.dart';
import 'service.dart';

// const url = "http://localhost:3030";

final ordersInstances = OrderService();

// ..addCabin(
//     cabinName: "Stugan 1",
//     address: "välkommenvägen 1",
//     rent: 1000,
//     size: "big")
// ..addCabin(
//     cabinName: "Stugan 2",
//     address: "välkomin 2",
//     rent: 1200,
//     size: "Gigantisk");

class OrderService {
  final List<Order> allOrders = [];
  final List<Service> allServices = [];

  void addOrder({
    required String cabinId,
    required String serviceType,
    required String servieTime,
  }) async {
    // var order = allOrders.firstWhere(
    //   (orde) => orde.cabin == cabinName,
    //   orElse: () {
    //     final value = Order(allOrders.length, cabinName);
    //     allOrders.add(value);
    //     return value;
    //   },
    // );
    var order = Order(
      id: allOrders.length,
      cabinId: cabinId,
      serviceType: serviceType,
      serviceTime: servieTime,
    );

    // var service = Service(allServices.length, serviceType);

    // order.service.add(service);
    allOrders.add(order);
  }
}
