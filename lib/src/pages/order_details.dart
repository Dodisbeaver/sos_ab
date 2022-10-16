import 'package:flutter/material.dart';

import '../data.dart';
import '../routing.dart';
import '../widgets/service_list.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(order.cabinId.toString()),
        ),
        body: Center(
          child: Column(
            children: [Text(order.serviceType), Text(order.serviceTime)],
          ),
        ),
      );
}
