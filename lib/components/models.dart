
import 'package:flutter/cupertino.dart';

class Model{
  final String id;
  final int created;
  final String root;

  Model({
    this.id,
    this.root,
    this.created,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
      id: json["id"],
      root: json["root"],
      created: json["created"]);

  static List<Model> modelsFromSnapshot(List modelSnapshot){
    return modelSnapshot.map((data) => Model.fromJson(data)).toList();
  }


}