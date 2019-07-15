import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget{

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column( children: transactions.map((item) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        "\$${item.amount.toString()}",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(item.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text(DateFormat('dd/MM/yyyy').format(item.date),style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ],
                ),
              );
            }).toList(),)
    );
  }
}
