import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  double price;
  DateTime date;

  Transaction(
      {@required this.id = "",
      @required this.title = "",
      @required this.price = 0.00,
      required this.date});
}
