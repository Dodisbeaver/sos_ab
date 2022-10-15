import 'package:flutter/material.dart';
import 'package:sos_ab/src/models/api_service.dart';

import '../data.dart';
import '../routing.dart';
import '../widgets/cabin_list.dart';

class CabinScreen extends StatefulWidget {
  const CabinScreen({
    super.key,
  });

  @override
  State<CabinScreen> createState() => _CabinScreenState();
}

class _CabinScreenState extends State<CabinScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this)
      ..addListener(_handleTabIndexChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newPath = _routeState.route.pathTemplate;
    if (newPath.startsWith('/cabins/all')) {
      _tabController.index = 0;
    }
    //  else if (newPath.startsWith('/cabins/new')) {
    //   _tabController.index = 1;
    // } else if (newPath == '/cabins/all') {
    //   _tabController.index = 2;
    // }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndexChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Stugor'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Stugor',
                icon: Icon(Icons.holiday_village),
              ),
              // Tab(
              //   text: 'Nya(test)',
              //   icon: Icon(Icons.new_releases),
              // ),
              // Tab(
              //   text: 'Andra(test)',
              //   icon: Icon(Icons.list),
              // ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CabinList(
              cabins: orderInstance.allCabins,
              onTap: _handleCabinTapped,
            ),
          ],
        ),
      );

  RouteState get _routeState => RouteStateScope.of(context);

  void _handleCabinTapped(Cabin cabin) {
    print(cabin);
    _routeState.go('/cabin/${cabin.id}');
  }

  void _handleTabIndexChanged() {
    switch (_tabController.index) {
      case 1:
        _routeState.go('/cabins/all');
        break;
      // case 2:
      //   _routeState.go('/cabins/new');
      //   break;
      // case 0:
      // default:
      //   _routeState.go('/cabins/all');
      //   break;
    }
  }
}
