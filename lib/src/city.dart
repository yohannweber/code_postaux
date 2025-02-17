// Copyright (c) 2016, Kevin Segaud. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

class City {
  String? zipCode;
  String? inseeCode;
  String? cityName;
  String? label;

  City(
      {this.cityName = "",
      this.inseeCode = "",
      this.zipCode = "",
      this.label = ""});

  City.fromJson(String this.zipCode, List<dynamic> infos) {
    if (!infos.isEmpty) {
      inseeCode = infos[0] ?? "";
      cityName = infos[1] ?? "";
      label = infos[2] ?? "";
    }
  }
  // City.fromJson(Map<String, dynamic> json){

  // }

  String toString() => "$cityName $zipCode $inseeCode $label";
}
