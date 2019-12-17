import 'dart:core';

import 'take-it-off.model.dart';

class User {
  int userId;
  String name;
  String accessToken;
  List<TakeItOff> listTakeItOff;

  //TODO remove
  User(this.userId, this.name);

  addNewTakeItOff(String nome) {
    if (listTakeItOff == null) {
      listTakeItOff = new List<TakeItOff>();
    }
    var add = true;
    for (var i = 0; i < listTakeItOff.length; i++) {
      if (listTakeItOff[i].name == nome) {
        add = false;
        break;
      }
    }
    if (add) {
      listTakeItOff.add(TakeItOff(nome, ""));
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
