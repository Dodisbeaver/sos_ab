import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sos_ab/src/models/api_service.dart';

import '../auth.dart';
import '../data.dart';
import '../routing.dart';
import '../pages/sign_in.dart';
import 'cabin_details.dart';
import 'order_details.dart';
import 'service_details.dart';
import '../widgets/fade_transition_page.dart';
// import 'author_details.dart';
// import 'book_details.dart';
import 'scaffold.dart';

/// Builds the top-level navigator for the app. The pages to display are based
/// on the `routeState` that was parsed by the TemplateRouteParser.
class SosAbNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SosAbNavigator({
    required this.navigatorKey,
    super.key,
  });

  @override
  State<SosAbNavigator> createState() => _SosAbNavigatorState();
}

class _SosAbNavigatorState extends State<SosAbNavigator> {
  final _signInKey = const ValueKey('Sign in');
  final _scaffoldKey = const ValueKey('App scaffold');
  final _cabinDetailsKey = const ValueKey('Cabin details screen');
  final _orderDetailsKey = const ValueKey('Order details screen');

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final authState = SosAbAuthScope.of(context);
    final pathTemplate = routeState.route.pathTemplate;

    Cabin? selectedCabin;
    print(selectedCabin?.id);
    if (pathTemplate == '/cabin/:cabinId') {
      print('$pathTemplate' ' pattthemp)');
      selectedCabin = orderInstance.allCabins.firstWhereOrNull(
          (b) => b.id.toString() == routeState.route.parameters['cabinId']);
    }

    Order? selectedOrder;
    if (pathTemplate == '/order/:orderId') {
      selectedOrder = orderInstance.allOrders.firstWhereOrNull(
          (b) => b.id.toString() == routeState.route.parameters['orderId']);
    }

    return Navigator(
      key: widget.navigatorKey,
      onPopPage: (route, dynamic result) {
        // When a page that is stacked on top of the scaffold is popped, display
        // the /books or /authors tab in BookstoreScaffold.
        if (route.settings is Page &&
            (route.settings as Page).key == _cabinDetailsKey) {
          routeState.go('/cabins/all');
        }

        if (route.settings is Page &&
            (route.settings as Page).key == _orderDetailsKey) {
          routeState.go('/orders');
        }

        return route.didPop(result);
      },
      pages: [
        if (routeState.route.pathTemplate == '/signin')
          // Display the sign in screen.
          FadeTransitionPage<void>(
            key: _signInKey,
            child: SignInScreen(
              onSignIn: (credentials) async {
                var signedIn = await authState.signIn(
                    credentials.username, credentials.password);
                if (signedIn) {
                  await routeState.go('/cabins/all');
                }
              },
            ),
          )
        else ...[
          // Display the app
          FadeTransitionPage<void>(
            key: _scaffoldKey,
            child: const SosAbScaffold(),
          ),
          // Add an additional page to the stack if the user is viewing a book
          // or an author
          if (selectedCabin != null)
            MaterialPage<void>(
              key: _cabinDetailsKey,
              child: CabinDetailsScreen(
                cabin: selectedCabin,
              ),
            )
          else if (selectedOrder != null)
            MaterialPage<void>(
              key: _orderDetailsKey,
              child: OrderDetailsScreen(
                order: selectedOrder,
              ),
            ),
        ],
      ],
    );
  }
}
