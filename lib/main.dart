import 'package:flutter/material.dart';
import './models/transation.dart';
import './widgets/new_transation.dart';
import './widgets/transation_list.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 final List<Transation> _userTransations = [
    Transation(
        id: '3de', title: 'New shoes', amount: 120, date: DateTime.now()),
    Transation(
        id: '3df', title: 'Weekly groceries', amount: 34, date: DateTime.now()),
  ];
  void _addNewTransation(String txTitle, double txAmount) {
    final newTx = Transation(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransations.add(newTx);
    });
  }

  void _startAddNewTransation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: (){},
            child: NewTransation(_addNewTransation),
            behavior: HitTestBehavior.opaque,
            );
        });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses '),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                size: 35,
              ),
              onPressed:() =>_startAddNewTransation(context),
          )],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('card widget'),
                elevation: 6,
              ),
            ),
             TransationList(_userTransations),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () =>_startAddNewTransation(context),),
    );
  }
}
