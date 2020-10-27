import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myExpenses/models/transation.dart';

class TransationList extends StatelessWidget {
  final List<Transation> transations;
  TransationList(this.transations);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${transations[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transations[index].title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      DateFormat.yMMMEd().format(transations[index].date),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transations.length,
      ),
    );
  }
}
