// Copyright (c) 2016, Kevin Segaud. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'src/html.dart';
import 'src/city.dart';

export 'src/city.dart';

Map<String,dynamic>? _zipCodeJson;

/// Find a [List<City>] corresponding to the [zipCode]
Future<List<City>> find(String zipCode) async {
  if (_zipCodeJson == null) {
    _zipCodeJson = await getZipCodes();
  }
  final cities = _zipCodeJson?[zipCode] as List<List<String>>?;
  if (cities == null || cities.length == 0) {
    return [new City.fromJson(zipCode, _zipCodeJson?[0].first)];
  } else {
    return cities
        .map((city) => new City.fromJson(zipCode, city))
        .toList();
  }
}
