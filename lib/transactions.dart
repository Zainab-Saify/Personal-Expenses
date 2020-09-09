import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  final String title;
  final num amount;
  final DateTime date;
  static int n = 0;

  Transaction(
      {@required this.title, @required this.amount, @required this.date}) {
    id = 't' + n.toString();
    n++;
  }
}
