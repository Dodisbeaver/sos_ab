import 'package:flutter/material.dart';

import '../models/api_service.dart';
import '../routing.dart';
import '../widgets/order_list .dart';

class OrderScreen extends StatelessWidget {
  final String title = 'Orders';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: OrderList(
          orders: orderInstance.allOrders,
          onTap: (order) {
            RouteStateScope.of(context).go('/order/${order.id}');
          },
        ),
      );
}
