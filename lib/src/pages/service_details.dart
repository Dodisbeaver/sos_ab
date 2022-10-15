import 'package:flutter/material.dart';
import 'package:sos_ab/src/models/service.dart';
import 'package:url_launcher/link.dart';

import '../data.dart';
import 'order_details.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final Service? service;

  const ServiceDetailsScreen({
    super.key,
    this.service,
  });

  @override
  Widget build(BuildContext context) {
    if (service == null) {
      return const Scaffold(
        body: Center(
          child: Text('Ingen Service hittad. Pröva lägga till'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(service!.serviceType),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              service!.serviceType,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              child: const Text('View author (Push)'),
              onPressed: () {
                //TODO: Lägg till en lägg till service funktion

                // Navigator.of(context).push<void>(
                //   MaterialPageRoute<void>(
                //     builder: (context) =>
                //         AuthorDetailsScreen(author: service!.author),
                //   ),
                // );
              },
            ),
            // Link(
            //   uri: Uri.parse('/author/${service!.author.id}'),
            //   builder: (context, followLink) => TextButton(
            //     onPressed: followLink,
            //     child: const Text('View author (Link)'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
