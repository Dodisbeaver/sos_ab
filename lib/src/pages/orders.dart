import 'package:flutter/material.dart';
import 'package:sos_ab/src/models/order_library.dart';

import '../models/cabin_library.dart';
import '../routing.dart';
import '../widgets/order_list .dart';

class OrderScreen extends StatelessWidget {
  final String title = 'Beställningar';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: OrderList(
          orders: ordersInstances.allOrders,
          onTap: (order) {
            RouteStateScope.of(context).go('/order/${order.id}');
          },
        ),
      );
}
