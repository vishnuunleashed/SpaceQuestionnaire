// To parse this JSON data, do
//
//     final satelliteModel1 = satelliteModel1FromJson(jsonString);

import 'dart:convert';

SatelliteModel1 satelliteModel1FromJson(String str) => SatelliteModel1.fromJson(json.decode(str));

String satelliteModel1ToJson(SatelliteModel1 data) => json.encode(data.toJson());

class SatelliteModel1 {
  SatelliteModel1({
    this.customerSatellites,
  });

  List<CustomerSatellite>? customerSatellites;

  factory SatelliteModel1.fromJson(Map<String, dynamic> json) => SatelliteModel1(
    customerSatellites: List<CustomerSatellite>.from(json["customer_satellites"].map((x) => CustomerSatellite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customer_satellites": List<dynamic>.from(customerSatellites!.map((x) => x.toJson())),
  };
}

class CustomerSatellite {
  CustomerSatellite({
    this.id,
    this.country,
    this.launchDate,
    this.mass,
    this.launcher,
  });

  String? id;
  String? country;
  String? launchDate;
  String? mass;
  String? launcher;

  factory CustomerSatellite.fromJson(Map<String, dynamic> json) => CustomerSatellite(
    id: json["id"],
    country: json["country"],
    launchDate: json["launch_date"],
    mass: json["mass"],
    launcher: json["launcher"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "launch_date": launchDate,
    "mass": mass,
    "launcher": launcher,
  };
}
