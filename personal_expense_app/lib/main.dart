import 'package:flutter/material.dart';
import './transcation.dart';

void main() => runApp(MyApp());

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
              color: Colors.yellowAccent,
              width: 150,
              height: 200,
              child: Card(
                shadowColor: Colors.black,
                color: Colors.amber,
                child: Text(
                  'Some Dummy Text for Chart Widget',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ), // width of the card is depnded on its child. Unless it itself is a child like in this case we have made CARD a child of the contianer and therefore it listens to the parent. Bydefault it takes as much width as it is required for the child/parent.
                elevation:
                    20, // TL;DR card takes childs width unless there is a width defined by the parent then it takes the parents width
              ),
            ),
            Column(
              children: transactions.map((tx) {
                //transactions.map is mapping all the transactions as received so that a new card will be alloted for each transaction
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        child: Text(
                          tx.amount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            tx.date.toString(),
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
