import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transcation.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.blueGrey,
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.deepPurpleAccent, width: 2)),
                  child: Text(
                    '₹${transactions[index].amount}', //dollar is a reserved key for the purpose of string interpolation
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
                      '${transactions[index].title}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
        // children: transactions.map((tx) {
        //   //transactions.map is mapping all the transactions as received so that a new card will be alloted for each transaction
        // }).toList();
      ),
    );
  }
}
