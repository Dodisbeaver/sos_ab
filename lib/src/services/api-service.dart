import 'package:sos_ab/src/models/order_library.dart';
import 'package:sos_ab/src/services/get-orders.dart';

import '../data.dart';
import 'get-cabin.dart';

const url = "https://school-wom-project2.azurewebsites.net";
Future apiService() async {
  final cabinJson = await fetchCabins(url);
  final orderJson = await fetchOrders(url);

  List<Cabin> cabinObj = cabinJson.map((e) => Cabin.fromJson(e)).toList();
  cabinsInstances.allCabins.addAll(cabinObj);
  List<Order> orderObj = orderJson.map((e) => Order.fromJson(e)).toList();
  ordersInstances.allOrders.addAll(orderObj);
  return cabinObj;
}
