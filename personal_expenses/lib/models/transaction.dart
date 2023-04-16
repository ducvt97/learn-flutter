class Transaction {
  static int id = 0;
  String title;
  double amount;
  DateTime date;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
  }) {
    id++;
  }
}
