import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spentAmount;
  final double totalPercentofSpending;

  ChartBar(this.label, this.spentAmount, this.totalPercentofSpending);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('${spentAmount.toStringAsFixed(0)}'),
        SizedBox(height: 4),
        Container(
          height: 40,
          width: 20,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        )
      ],
    );
  }
}
