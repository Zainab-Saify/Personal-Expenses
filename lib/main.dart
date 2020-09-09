import 'package:flutter/material.dart';
import './insert_new_transaction.dart';
import './transactions.dart';
import './view_transaction.dart';
import './build_chart.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transaction = [];

  List<Transaction> get recentTransactions {
    DateTime lastdate = DateTime.now().subtract(Duration(days: 7));
    return transaction.where((tx) => tx.date.isAfter(lastdate)).toList();
  }

  void addTransaction(var title, num amount, DateTime date) {
    setState(() {
      transaction.add(Transaction(title: title, amount: amount, date: date));
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      transaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void openNewTransactionPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return InsertNew(addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daily Exenses'),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (_context) => FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'add new transaction',
            elevation: 4,
            onPressed: () => openNewTransactionPage(_context),
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                  child: Container(
                width: double.infinity,
                height: 200,
                child: Expanded(
                  child: Chart(recentTransactions),
                ),
              )),
              transaction.length > 0
                  ? ViewTransaction(transaction, deleteTransaction)
                  : Column(
                      children: [
                        Text(
                          "no data inserted yet",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        Image(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQdHnTddtF7uo24DldPx0TYOy53VkfnovJPnQ&usqp=CAU'),
                          height: 400,
                          width: double.infinity,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
