class Friend {
  int friendId;
  String name;
  String description;
  String code;
  //internal
  bool isCheked;

  Friend(this.friendId, this.name, this.description, this.code);

  Friend.fromJson(Map<String, dynamic> json) {
    friendId = json["friendId"];
    name = json["name"];
    description = json["description"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    return {
      "friendId": friendId,
      "name": name,
      "description": description,
      "code": code
    };
  }
}