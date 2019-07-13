import 'package:flutter/material.dart';
import './widgets/transactions_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'manager',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.purple
        ),
        home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userstransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 45.90,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        title: txtitle,
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userstransactions.add(newTx);
    });
  }

  void _startaddnewtransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appBar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startaddnewtransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'Charts..',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            TransactionsList(_userstransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => _startaddnewtransaction(context),
      ),
    );
  }
}