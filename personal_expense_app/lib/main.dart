import 'package:flutter/material.dart';
import './models/transcation.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

final titleController = TextEditingController();
final amountController = TextEditingController();
String titleInput;
String amountInput;

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
  final List<Transaction> transactions = [];
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
              height: 100,
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
            UserTransactions(),
          ],
        ));
  }
}
