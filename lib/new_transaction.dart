import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  DateTime _selectedDate = DateTime.now();
  void submitData() {
    if (priceController.text.isEmpty) return;
    var title = titleController.text;
    var price = double.parse(priceController.text);

    if (title.isEmpty || price <= 0 || _selectedDate == null) return;

    widget.addTransaction(title, price, _selectedDate);

    Navigator.of(context).pop(); // to close topmost screen i.e modal
  }

  //datepicker
  void _getDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen...'
                          : 'Chosen Date : ${DateFormat.yMMMd().format(_selectedDate)}'),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        onPressed: _getDatePicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: submitData,
                  child: Text('Add New Transaction'))
            ],
          ),
        ),
      ),
    );
  }
}
