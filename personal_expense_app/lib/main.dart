import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transcation.dart';

void main() => runApp(MyApp());

final titleController = TextEditingController();
final amountController = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Clothes', amount: 599, date: DateTime.now()),
    Transaction(id: 't2', title: 'Pendrive', amount: 1899, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 150,
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.black,
                color: Colors.deepPurpleAccent,
                child: Text(
                  '  Some Dummy Text for Chart Widget',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ), // width of the card is depnded on its child. Unless it itself is a child like in this case we have made CARD a child of the contianer and therefore it listens to the parent. Bydefault it takes as much width as it is required for the child/parent.
                elevation:
                    20, // TL;DR card takes childs width unless there is a width defined by the parent then it takes the parents width
              ),
            ),
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter the Description of your purchase'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Amount', hintText: 'Enter the amount'),
                    controller: amountController,
                    // onChanged: (value) {
                    //   amountInput = value;
                    // },
                    keyboardType: TextInputType.number,
                  ),
                  FlatButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      textColor: Colors.deepPurpleAccent,
                      child: Text('Add Transaction'))
                ],
              ),
            ),
            Column(
              children: transactions.map((tx) {
                //transactions.map is mapping all the transactions as received so that a new card will be alloted for each transaction
                return Card(
                  shadowColor: Colors.blueGrey,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepPurpleAccent, width: 2)),
                        child: Text(
                          '₹${tx.amount}', //dollar is a reserved key for the purpose of string interpolation
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${tx.title}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
