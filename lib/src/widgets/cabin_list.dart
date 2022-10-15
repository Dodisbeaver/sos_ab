import 'package:flutter/material.dart';

import '../data.dart';

class CabinList extends StatelessWidget {
  final List<Cabin> cabins;
  final ValueChanged<Cabin>? onTap;

  const CabinList({
    required this.cabins,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: cabins.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            cabins[index].cabin,
          ),
          // subtitle: Text(
          //   cabins[index].order,
          // ),
          onTap: onTap != null ? () => onTap!(cabins[index]) : null,
        ),
      );
}
