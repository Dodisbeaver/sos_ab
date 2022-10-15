// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';

import '../routing.dart';
import 'scaffold_body.dart';

class SosAbScaffold extends StatelessWidget {
  const SosAbScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final selectedIndex = _getSelectedIndex(routeState.route.pathTemplate);

    return Scaffold(
      body: AdaptiveNavigationScaffold(
        selectedIndex: selectedIndex,
        body: const SosAbScaffoldBody(),
        onDestinationSelected: (idx) {
          if (idx == 0) routeState.go('/cabins/orders');
          if (idx == 1) routeState.go('/orders');
          if (idx == 2) routeState.go('/services');
        },
        destinations: const [
          AdaptiveScaffoldDestination(
            title: 'Cabins',
            icon: Icons.home,
          ),
          AdaptiveScaffoldDestination(
            title: 'Orders',
            icon: Icons.money,
          ),
          AdaptiveScaffoldDestination(
            title: 'Services',
            icon: Icons.room_service,
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(String pathTemplate) {
    if (pathTemplate.startsWith('/cabins')) return 0;
    if (pathTemplate == '/orders') return 1;
    if (pathTemplate == '/services') return 2;
    return 0;
  }
}
