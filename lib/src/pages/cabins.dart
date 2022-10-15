import 'package:flutter/material.dart';
import 'package:sos_ab/src/models/api_service.dart';

import '../data.dart';
import '../routing.dart';
import '../widgets/cabin_list.dart';

class CabinScreen extends StatelessWidget {
  final String title = 'Stugor';

  const CabinScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: CabinList(
          cabins: orderInstance.allCabins,
          onTap: (cabin) {
            RouteStateScope.of(context).go('/cabin/${cabin.id}');
          },
        ),
      );
}
