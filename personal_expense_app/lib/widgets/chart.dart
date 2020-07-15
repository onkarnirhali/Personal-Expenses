import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transcation.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Row(
          children: groupedTransactions.map((e) {
        // this logic will fetch the data from the groupedtransactions and show it on the chart widget.
        return Text('${e['Day']}: ${e['amount']}'
            .toString()); // we have concatenated the data
      }).toList()), // since it is a data of 7 days we needed to make it in a list
    );
  }
}
