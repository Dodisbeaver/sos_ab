// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:sos_ab/src/models/service.dart';

import '../data.dart';

class ServiceList extends StatelessWidget {
  final List<Service> services;
  final ValueChanged<Service>? onTap;

  const ServiceList({
    required this.services,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            services[index].serviceType,
          ),
          // subtitle: Text(
          //   '${services[index].books.length} books',
          // ),
          onTap: onTap != null ? () => onTap!(services[index]) : null,
        ),
      );
}
