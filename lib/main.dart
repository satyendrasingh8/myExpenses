import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myExpenses/widgets/chart.dart';
import './models/transation.dart';
import './widgets/new_transation.dart';
import './widgets/transation_list.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  //  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Personal Expenses!',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18.0,
              )),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transation> _userTransations = [
    // Transation(
    //     id: '3de', title: 'New shoes', amount: 120, date: DateTime.now()),
    // Transation(
    //     id: '3df', title: 'Weekly groceries', amount: 34, date: DateTime.now()),
  ];
  bool _showChart = false;
  List<Transation> get _recentTransations {
    return _userTransations.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransation(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transation(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
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
            onTap: () {},
            child: NewTransation(_addNewTransation),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransation(String id) {
    setState(() {
      _userTransations.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
     final appBar = AppBar(
        title: Text('Personal Expenses '),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () => _startAddNewTransation(context),
          )
        ],
      );

       final txListWidget = Container(
         height: (MediaQuery.of(context).size.height*0.6 -
             appBar.preferredSize.height - MediaQuery.of(context).padding.top)*1.2,
         child: TransationList(
           _userTransations,
           _deleteTransation,
         ),
       );
     List<Widget> _buildLandScapeContent(){
       return [Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Show Chart'),
           Switch.adaptive(
               activeColor: Theme.of(context).accentColor,
               value: _showChart, onChanged: (val){
             setState(() {
               _showChart = val;
             });
           }),
         ],
       ),
       _showChart ?
       Container(
       height: (MediaQuery.of(context).size.height*0.4 -
       appBar.preferredSize.height - MediaQuery.of(context).padding.top)*2.6,
       child: Chart(_recentTransations)) :
       txListWidget];
     }
    List<Widget> _buildPortraitContent(){
      return  [Container(
          height: (MediaQuery.of(context).size.height*0.4 -
              appBar.preferredSize.height - MediaQuery.of(context).padding.top),
          child: Chart(_recentTransations)),txListWidget,];
    }

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             if(isLandscape) ..._buildLandScapeContent(),
            if(!isLandscape)  ..._buildPortraitContent()


          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransation(context),
      ),
    );
  }
}
