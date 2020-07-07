import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transcation_list.dart';
import '../models/transcation.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Clothes', amount: 599, date: DateTime.now()),
    Transaction(id: 't2', title: 'Pendrive', amount: 1899, date: DateTime.now())
  ];
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(), TransactionList(_userTransaction)],
    );
  }
}
