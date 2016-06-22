// Copyright (c) 2016, Kevin Segaud. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future main(List<String> args) async {
  if (args.length != 1) return null;
  File codePostaux = new File(args[0]);
  Stream<String> lineStream = codePostaux
      .openRead()
      .transform(LATIN1.decoder)
      .transform(new LineSplitter());
  Map mappedCodePostaux = <String, List<List>>{};
  await for (String line in lineStream.skip(1)) {
    List<String> infosCity = line.split(";");
    if (!mappedCodePostaux.containsKey(infosCity[2])) {
      mappedCodePostaux[infosCity[2]] = [];
    }
    mappedCodePostaux[infosCity[2]]
        .add([infosCity[0], infosCity[1], infosCity[3]]);
  }
  File code_postaux = new File("lib/code_postaux.json");
  code_postaux.writeAsStringSync(JSON.encode(mappedCodePostaux));
}
