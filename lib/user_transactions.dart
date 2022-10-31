import 'package:expenses_app/new_transaction.dart';
import 'package:expenses_app/transaction.dart';
import 'package:expenses_app/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: '1', title: 'New Shoes', price: 874.00, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double price) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(transactions)
      ],
    );
  }
}
