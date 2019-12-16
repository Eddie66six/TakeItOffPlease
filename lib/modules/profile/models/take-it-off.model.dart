import 'take-it-off-item.model.dart';

class TakeItOff {
  String name;
  String description;
  List<TakeItOffItem> itens;

  TakeItOff(this.name, this.description, {this.itens});

  addItem(TakeItOffItem item) {
    if(itens == null) itens = List<TakeItOffItem>();
    itens.add(item);
  }

  removeItem(TakeItOffItem item) {
    if(itens == null) return;
    itens.removeAt(itens.indexOf(item));
  }

  TakeItOff.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    itens = json['itens'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'itens': itens
      };
}
