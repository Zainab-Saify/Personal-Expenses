import 'package:Personal_Expense/chart_bars.dart';
import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transaction;
  double weeklyTotal = 0;

  Chart(this.transaction);

  List<Map<String, Object>> get groppedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double total = 0;

      for (int i = 0; i < transaction.length; i++) {
        if (transaction[i].date.day == weekday.day &&
            transaction[i].date.month == weekday.month &&
            transaction[i].date.year == weekday.year) {
          total = total + transaction[i].amount;
        }
      }
      weeklyTotal = weeklyTotal + total;
      return {'day': DateFormat.E().format(weekday), 'amount': total};
    }).reversed.toList();
  }

  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
            children: groppedTransactionValues.map((data) {
          return Container(
            width: 45,
            height: 180,
            child: Column(
              children: <Widget>[
                Text(
                  data['amount'].toString().length > 3
                      ? "Rs. ${data['amount'].toString().substring(0, 3)}..."
                      : "Rs. ${data['amount']}",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                ChartBars(weeklyTotal > 0
                    ? (data['amount'] as double) / weeklyTotal
                    : 0),
                Text(
                  data['day'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          );
        }).toList()));
  }
}
