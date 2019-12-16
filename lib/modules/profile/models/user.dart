import 'dart:core';

import 'take-it-off.model.dart';

class User {
  int userId;
  String name;
  String accessToken;
  List<TakeItOff> listTakeItOff;

  //TODO remove
  User(this.userId, this.name);

  addNewTakeItOff(TakeItOff takeItOff) {
    if(listTakeItOff == null) {
      listTakeItOff = new List<TakeItOff>();
    }
    listTakeItOff.add(takeItOff);
  }

  User.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    name = json["name"];
    accessToken = json["accessToken"];
    listTakeItOff = json["listTakeItOff"];
  }

  Map<String, dynamic> toJson(){
    return {
      "userId": userId,
      "name": name,
      "accessToken": accessToken,
      "listTakeItOff": listTakeItOff
    };
  }
}