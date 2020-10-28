import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myExpenses/models/transation.dart';

class TransationList extends StatelessWidget {
  final List<Transation> transations;
  final Function deleteTx;
  TransationList(this.transations, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transations.isEmpty
        ? LayoutBuilder(builder: (ctx,constraints) {
          return Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text('No transations Added yet!',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: constraints.maxHeight*0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          );
    },)
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                          child: Text('\$${transations[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transations[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transations[index].date)),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transations[index].id)),
                ),
              );
            },
            itemCount: transations.length,
          );
  }
}
