// To parse this JSON data, do
//
//     final launcherModel1 = launcherModel1FromJson(jsonString);

import 'dart:convert';

LauncherModel1 launcherModel1FromJson(String str) => LauncherModel1.fromJson(json.decode(str));

String launcherModel1ToJson(LauncherModel1 data) => json.encode(data.toJson());

class LauncherModel1 {
  LauncherModel1({
    this.launchers,
  });

  List<Launcher>? launchers;

  factory LauncherModel1.fromJson(Map<String, dynamic> json) => LauncherModel1(
    launchers: List<Launcher>.from(json["launchers"].map((x) => Launcher.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "launchers": List<dynamic>.from(launchers!.map((x) => x.toJson())),
  };
}

class Launcher {
  Launcher({
    this.id,
  });

  String? id;

  factory Launcher.fromJson(Map<String, dynamic> json) => Launcher(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
