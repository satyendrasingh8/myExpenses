import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myExpenses/models/transation.dart';

class transationList extends StatefulWidget {
  @override
  _transationListState createState() => _transationListState();
}

class _transationListState extends State<transationList> {
  final List<Transation> _userTransation = [
    Transation(
        id: '3de', title: 'New shoes', amount: 120, date: DateTime.now()),
    Transation(
        id: '3df', title: 'Weekly groceries', amount: 34, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransation.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.pink,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${tx.amount}',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tx.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    DateFormat.yMMMEd().format(tx.date),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
