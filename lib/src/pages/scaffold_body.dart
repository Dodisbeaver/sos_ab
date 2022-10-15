// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../routing.dart';
import '../pages/services.dart';
import '../widgets/fade_transition_page.dart';
import 'cabins.dart';
import 'orders.dart';
import 'scaffold.dart';

/// Displays the contents of the body of [SosAbScaffold]
class SosAbScaffoldBody extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const SosAbScaffoldBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var currentRoute = RouteStateScope.of(context).route;

    // A nested Router isn't necessary because the back button behavior doesn't
    // need to be customized.
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, dynamic result) => route.didPop(result),
      pages: [
        if (currentRoute.pathTemplate.startsWith('/orders'))
          const FadeTransitionPage<void>(
            key: ValueKey('orders'),
            child: OrderScreen(),
          )
        else if (currentRoute.pathTemplate.startsWith('/services'))
          const FadeTransitionPage<void>(
            key: ValueKey('services'),
            child: ServicesScreen(),
          )
        else if (currentRoute.pathTemplate.startsWith('/cabins') ||
            currentRoute.pathTemplate == '/')
          const FadeTransitionPage<void>(
            key: ValueKey('cabins'),
            child: BooksScreen(),
          )

        // Avoid building a Navigator with an empty `pages` list when the
        // RouteState is set to an unexpected path, such as /signin.
        //
        // Since RouteStateScope is an InheritedNotifier, any change to the
        // route will result in a call to this build method, even though this
        // widget isn't built when those routes are active.
        else
          FadeTransitionPage<void>(
            key: const ValueKey('empty'),
            child: Container(),
          ),
      ],
    );
  }
}
