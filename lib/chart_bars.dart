import 'package:flutter/material.dart';

class ChartBars extends StatelessWidget {
  final double totalSpentPercentage;

  ChartBars(this.totalSpentPercentage);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(),
      width: 30,
      height: 100,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(20)),
          ),
          FractionallySizedBox(
            heightFactor: totalSpentPercentage,
            child: Container(
              decoration: BoxDecoration(
                  color: totalSpentPercentage > 0.5
                      ? Colors.red[200]
                      : Colors.blue[100],
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
