import 'processed-list-item.model.dart';

class ProcessedListSubItem {
  int processedListSubItemId;
  String name;
  List<ProcessedListItem> itens;

  ProcessedListSubItem(this.processedListSubItemId, this.name, this.itens);

  get countItens => itens?.length ?? 0;

  ProcessedListSubItem.fromJson(Map<String, dynamic> json) {
    processedListSubItemId = int.parse(json['processedListSubItemId']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() =>
      {
        'processedListSubItemId': processedListSubItemId,
        'name': name
      };
}