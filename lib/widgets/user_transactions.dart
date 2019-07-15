import 'package:flutter/material.dart';
import '../models/transaction.dart';

import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

    final List<Transaction> _transactions = [
    Transaction(
        id: "T1", amount: 55, date: DateTime.now(), title: "buy mobile"),
    Transaction(
        id: "T2", amount: 68, date: DateTime.now(), title: "buy macbook"),
  ];

  void _addNewTransaction(String title,double amount){
     var newTx = Transaction(title: title,amount: amount,date: DateTime.now(),id: DateTime.now().toString());
    setState(() {
      _transactions.add(newTx);
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         NewTransaction(_addNewTransaction),
         TransactionList(_transactions)
       ],
    );
  }
}