class TakeItOffItem {
  int takeItOffItemId;
  String name;
  String description;

  TakeItOffItem(this.name, this.description);

  TakeItOffItem.fromJson(Map<String, dynamic> json) {
    takeItOffItemId = int.parse(json['takeItOffItemId']);
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() =>
      {'takeItOffItemId': takeItOffItemId, 'name': name, 'description': description};
}