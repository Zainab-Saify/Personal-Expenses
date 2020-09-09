import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EachTransaction extends StatelessWidget {
  final String title;
  final num amount;
  final DateTime date;
  final String id;
  final Function deleteTranscation;

  EachTransaction(
      this.title, this.amount, this.date, this.id, this.deleteTranscation);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 8,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text("Rs." + amount.toStringAsFixed(2)),
            ),
          ),
        ),
        title: Text(
          title,
          textAlign: TextAlign.left,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(date),
          textAlign: TextAlign.left,
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete), onPressed: () => deleteTranscation(id)),
      ),
    );
  }
}
