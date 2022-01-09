import 'dart:convert';

LaunchersModel spacecraftsModelFromJson(String str) => LaunchersModel.fromJson(json.decode(str));

String spacecraftsModelToJson(LaunchersModel data) => json.encode(data.toJson());

class LaunchersModel {
  LaunchersModel({
    this.spacecrafts,
  });

  List<Spacecraft>? spacecrafts;

  factory LaunchersModel.fromJson(Map<String, dynamic> json) => LaunchersModel(
    spacecrafts: List<Spacecraft>.from(json["spacecrafts"].map((x) => Spacecraft.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "spacecrafts": List<dynamic>.from(spacecrafts!.map((x) => x.toJson())),
  };
}

class Spacecraft {
  Spacecraft({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Spacecraft.fromJson(Map<String, dynamic> json) => Spacecraft(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
