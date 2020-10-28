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
      child: transations.isEmpty ? Column(children: [
           SizedBox(height: 5,),
      Text('No transations Added yet!', style: Theme.of(context).textTheme.title),
     SizedBox(height: 20,),
      Container(
        height:250,
        child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),

      ],) : ListView.builder(
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
                      style: Theme.of(context).textTheme.title,
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
