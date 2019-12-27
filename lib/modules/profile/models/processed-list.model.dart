import 'processed-list-sub-item.model.dart';

class ProcessedList {
  int processedListId;
  String name;
  DateTime date;
  List<ProcessedListSubItem> itens;

  ProcessedList(this.processedListId, this.name, this.date, {this.itens});

  get countItens => itens?.length ?? 0;

  ProcessedList.fromJson(Map<String, dynamic> json) {
    processedListId = int.parse(json['processedListId']);
    name = json['name'];
    date = json['date'];
    itens = json['itens'];
  }

  Map<String, dynamic> toJson() =>
      {
        'processedListId': processedListId,
        'name': name,
        'date': date,
        'itens': itens
      };
}