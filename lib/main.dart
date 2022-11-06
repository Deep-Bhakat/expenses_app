import 'package:expenses_app/chart.dart';
import 'package:expenses_app/new_transaction.dart';
import 'package:expenses_app/transaction.dart';
import 'package:expenses_app/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'QuickSand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    // Transaction(
    // id: '1', title: 'New Shoes', price: 874.00, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double price, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now().toString(), title: title, price: price, date: date);

    setState(() {
      transactions.add(newTx);
    });
  }

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter App',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: [
          IconButton(
              onPressed: () => startNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Chart(_recentTransactions), TransactionList(transactions)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            startNewTransaction(context);
          }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
