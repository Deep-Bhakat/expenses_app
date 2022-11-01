import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key? key}) : super(key: key);
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  void submitData() {
    var title = titleController.text;
    var price = double.parse(priceController.text);

    if (title.isEmpty || price <= 0) return;

    widget.addTransaction(title, price);

    Navigator.of(context).pop(); // to close topmost screen i.e modal
  }

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
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: priceController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   priceInput = val;
              // },
            ),
            TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: submitData,
                child: Text('Add New Transaction'))
          ],
        ),
      ),
    );
  }
}
