import 'take-it-off-item.model.dart';

class TakeItOff {
  String name;
  String description;
  List<TakeItOffItem> itens;

  TakeItOff(this.name, this.description, {this.itens});

  get countItens => itens?.length ?? 0;

  addItem(String name) {
    if(name == null || name == "" || name == " ") return;
    if(itens == null) itens = List<TakeItOffItem>();
    var add = true;
    for (var i = 0; i < itens.length; i++) {
      if(itens[i].name == name){
        add = false;
        break;
      }
    }
    if(add) itens.insert(0, TakeItOffItem(name, ""));
  }

  removeItem(String name) {
    if(itens == null) return;
    for (var i = 0; i < itens.length; i++) {
      if(itens[i].name == name){
        itens.removeAt(i);
        break;
      }
    }
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
