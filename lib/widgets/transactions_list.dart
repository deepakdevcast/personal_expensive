import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionsList(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return userTransactions.isEmpty
              ? Column(
                  children: <Widget>[
                    Text(
                      'No Transactions,please add some !!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(height: 10,),
                    Container(
                        height: 200,
                        child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
                  ],
                )
              : Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 11.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.5, color: Theme.of(context).accentColor),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 5,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userTransactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .add_jm()
                                .format(userTransactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
