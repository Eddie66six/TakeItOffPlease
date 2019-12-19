import 'dart:core';

import 'take-it-off.model.dart';

class User {
  int userId;
  String name;
  String accessToken;
  List<TakeItOff> listTakeItOff;

  //TODO remove
  User(this.userId, this.name);

  get countItens => listTakeItOff?.length ?? 0;

  addNewTakeItOff(String name) {
    if(name == null || name == "" || name == " ") return;
    if (listTakeItOff == null) listTakeItOff = new List<TakeItOff>();
    var add = true;
    for (var i = 0; i < listTakeItOff.length; i++) {
      if (listTakeItOff[i].name == name) {
        add = false;
        break;
      }
    }
    if (add) listTakeItOff.insert(0, TakeItOff(name, ""));
  }

  removeTakeItOff(String name){
    if (listTakeItOff == null) return;
    for (var i = 0; i < listTakeItOff.length; i++) {
      if (listTakeItOff[i].name == name) {
        listTakeItOff.removeAt(i);
        break;
      }
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    name = json["name"];
    accessToken = json["accessToken"];
    listTakeItOff = json["listTakeItOff"];
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "accessToken": accessToken,
      "listTakeItOff": listTakeItOff
    };
  }
}
