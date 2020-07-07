import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter the Description of your purchase'),
            controller: titleController,
            // onChanged: (val) {
            //   titleInput = val;
            //   print(titleInput);
            // },
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
    );
  }
}
