// Copyright (c) 2016, Kevin Segaud. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/browser_client.dart';
import 'package:path/path.dart';

Future<Map<String, dynamic>?> getZipCodes() async {
  BrowserClient client = new BrowserClient();
  final filePath = join(Directory.current.path, 'lib', 'assets', 'code_postaux.json');
  Response response =
      await client.get(Uri(host:filePath));
  return jsonDecode(response.body);
}
