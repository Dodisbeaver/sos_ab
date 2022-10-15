import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../data.dart';
import 'order_details.dart';

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
    if (cabin == null) {
      return const Scaffold(
        body: Center(
          child: Text('No book found.'),
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
            Link(
              uri: Uri.parse('/order/${order!.id}'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: const Text('View author (Link)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
