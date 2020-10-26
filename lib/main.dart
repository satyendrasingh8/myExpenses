import 'package:flutter/material.dart';
import 'package:myExpenses/widgets/user_transation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test Appbar '),
        ),
        body:SingleChildScrollView(
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
              UserTransations()
            ],
          ),
        ));
  }
}
