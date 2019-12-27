class ProcessedListItem {
  int processedListItemId;
  String name;
  int amount;

  ProcessedListItem(this.processedListItemId, this.name, this.amount);

  ProcessedListItem.fromJson(Map<String, dynamic> json) {
    processedListItemId = int.parse(json['processedListItemId']);
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() =>
      {
        'processedListItemId': processedListItemId,
        'name': name,
        'amount': amount
      };
}