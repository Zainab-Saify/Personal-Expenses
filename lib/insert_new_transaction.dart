import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsertNew extends StatefulWidget {
  final Function addTransaction;

  InsertNew(this.addTransaction);

  @override
  _InsertNewState createState() => _InsertNewState();
}

class _InsertNewState extends State<InsertNew> {
  final title = TextEditingController();

  final amount = TextEditingController();
  final date = TextEditingController();
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    void submitTransaction() {
      if (double.parse(amount.text) <= 0 || selectedDate == null) {
        return;
      }
      widget.addTransaction(
          title.text, double.parse(amount.text), selectedDate);

      Navigator.of(context).pop();
    }

    void datePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              lastDate: DateTime.now(),
              firstDate: DateTime(2008))
          .then((pickedDate) {
        if (pickedDate == null)
          return;
        else {
          selectedDate = pickedDate;
          date.text = DateFormat.yMMMd().format(pickedDate);
        }
      });
    }

    return SingleChildScrollView(
      child: Container(
        //width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Card(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
              Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'New Bag', labelText: 'Title'),
                controller: title,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitTransaction(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: '3000',
                    labelText: 'Amount',
                    focusColor: Theme.of(context).primaryColorLight),
                controller: amount,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitTransaction(),
              ),
            ),
            Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 110,
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'pick a date'),
                        controller: date,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: datePicker,
                      child: Icon(Icons.calendar_today),
                    ),
                  ],
                )),
            FlatButton(
              color: Theme.of(context).primaryColorDark,
              child: Text(
                "add Transaction",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: submitTransaction,
            )
          ]),
        ),
      ),
    );
  }
}
