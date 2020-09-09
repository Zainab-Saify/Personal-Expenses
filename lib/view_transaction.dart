import 'package:flutter/material.dart';
import './transactions.dart';
import './each_transcation.dart';

class ViewTransaction extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransaction;

  ViewTransaction(this.transaction, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromRGBO(240, 248, 255, 0.4),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return EachTransaction(
                  transaction[index].title,
                  transaction[index].amount,
                  transaction[index].date,
                  transaction[index].id,
                  deleteTransaction);
            },
            itemCount: transaction.length,
          ),
        ));
  }
}
