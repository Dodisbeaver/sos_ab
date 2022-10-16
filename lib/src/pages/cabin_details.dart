import 'package:flutter/material.dart';
import 'package:sos_ab/src/widgets/service_list.dart';
import 'package:url_launcher/link.dart';

import '../data.dart';
import 'order_details.dart';
import '../models/cabin_library.dart';
import '../models/service_library.dart';

class CabinDetailsScreen extends StatelessWidget {
  final Cabin? cabin;
  final Order? order;

  const CabinDetailsScreen({
    super.key,
    this.cabin,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    const String serviceText = "Tjänster";

    if (cabin == null) {
      return const Scaffold(
        body: Center(
          child: Text('Ingen Stuga hittad'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(cabin!.cabin),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              cabin!.cabin,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              child: const Text('Se beställningar'),
              onPressed: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(
                    builder: (context) => OrderDetailsScreen(order: order!),
                  ),
                );
              },
            ),
            SizedBox(
              width: 100,
              child: Text(
                serviceText,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Expanded(
                child: SizedBox(
              width: 100,
              child: ServiceList(
                services: serviceInstance.allServices,
                onTap: (service) {
                  // cabin!.order.service.add(service);
                  // print(cabin!.order.service.length);
                  // print(order!.service.length);
                  // order!.service.add(service);
                },
              ),
            ))
            // Link(
            //   uri: Uri.parse('/order/${cabin!.cabin}'),
            //   builder: (context, followLink) => TextButton(
            //     onPressed: followLink,
            //     child: const Text('Se stugans beställningar'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
