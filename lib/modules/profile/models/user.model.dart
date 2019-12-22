import 'dart:core';

import 'friend.model.dart';
import 'take-it-off.model.dart';

class User {
  int userId;
  String name;
  String description;
  String code;
  String accessToken;
  List<TakeItOff> listTakeItOff;
  List<Friend> listFriends;

  //TODO remove
  User(this.userId, this.name, this.description, this.code);

  get countItens => listTakeItOff?.length ?? 0;

  get countFriends => listFriends?.length ?? 0;

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

  addNewFriend(Friend friend){
    if(listFriends == null) listFriends = List<Friend>();
    listFriends.add(friend);
  }

  removeFriend(Friend friend){
    for (var i = 0; i < listFriends.length; i++) {
      if(listFriends[i].code == friend.code){
        listFriends.removeAt(i);
        break;
      }
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    name = json["name"];
    description = json["description"];
    accessToken = json["accessToken"];
    listTakeItOff = json["listTakeItOff"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "description": description,
      "accessToken": accessToken,
      "listTakeItOff": listTakeItOff,
      "code": code
    };
  }
}
