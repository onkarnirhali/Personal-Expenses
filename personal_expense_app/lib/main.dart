import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/widgets/transcation_list.dart';
import './models/transcation.dart';

void main() => runApp(MyApp());

String titleInput;
String amountInput;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Clothes', amount: 599, date: DateTime.now()),
    Transaction(id: 't2', title: 'Pendrive', amount: 1899, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void startAddNewTransction(BuildContext ctxt) {
    showModalBottomSheet(
        context: ctxt,
        builder: (bCtxt) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.cyanAccent,
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  // void _addNewTransaction(String txTitle, double txAmount) {
  //   final newTx = Transaction(
  //       title: txTitle,
  //       amount: txAmount,
  //       date: DateTime.now(),
  //       id: DateTime.now().toString());

  //   setState(() {
  //     _transactions.add(newTx);
  //   });
  // }

  // void _startAddNewTransction(BuildContext ctxt) {
  //   showModalBottomSheet(
  //       context: ctxt,
  //       builder: (bCtxt) {
  //         return NewTransaction(_addNewTransaction);
  //       });
  // }

  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Clothes', amount: 599, date: DateTime.now()),
    Transaction(id: 't2', title: 'Pendrive', amount: 1899, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransction(BuildContext ctxt) {
    showModalBottomSheet(
        context: ctxt,
        builder: (bCtxt) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expense',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransction(context)),
    );
  }
}
