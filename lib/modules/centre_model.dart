
import 'dart:convert';

CentreModel centreModelFromJson(String str) => CentreModel.fromJson(json.decode(str));

String centreModelToJson(CentreModel data) => json.encode(data.toJson());

class CentreModel {
  CentreModel({
    this.centres,
  });

  List<Centre>? centres;

  factory CentreModel.fromJson(Map<String, dynamic> json) => CentreModel(
    centres: List<Centre>.from(json["centres"].map((x) => Centre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "centres": List<dynamic>.from(centres!.map((x) => x.toJson())),
  };
}

class Centre {
  Centre({
    this.id,
    this.name,
    this.place,
    this.state,
  });

  int? id;
  String? name;
  String? place;
  String? state;

  factory Centre.fromJson(Map<String, dynamic> json) => Centre(
    id: json["id"],
    name: json["name"],
    place: json["Place"],
    state: json["State"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "Place": place,
    "State": state,
  };
}
