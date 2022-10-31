import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({Key? key}) : super(key: key);
  final Function addTransaction;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  NewTransaction(this.addTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: priceController,
              // onChanged: (val) {
              //   priceInput = val;
              // },
            ),
            TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  addTransaction(
                      titleController.text, double.parse(priceController.text));
                },
                child: Text('Add New Transaction'))
          ],
        ),
      ),
    );
  }
}
