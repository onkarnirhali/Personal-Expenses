import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function
      addTx; // we created this funtion so that we could pass this on press of the add transcation button
  NewTransaction(this.addTx);
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
                addTx(
                    titleController.text, double.parse(amountController.text));
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
