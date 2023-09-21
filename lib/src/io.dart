// Copyright (c) 2016, Kevin Segaud. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

Future<Map> getZipCodes() async {
  final filePath = join(Directory.current.path, 'lib', 'assets', 'code_postaux.json');
  File zipCode = new File(filePath);
  return jsonDecode(await zipCode.readAsString());
}
