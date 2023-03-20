class HistoryModel {
  int? id;
  late String expression;
  late String result;
  late String date;

  HistoryModel({
    this.id,
    required this.expression,
    required this.result,
    required this.date,
  });

  HistoryModel.fromMap(Map map) {
    id = map['_id'];
    expression = map['expression'];
    result = map['result'];
    date = map['date'];
  }
}
