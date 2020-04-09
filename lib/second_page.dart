import 'package:flutter/material.dart';

import './global_state.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  GlobalState _store = GlobalState.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Text('The magic number is ${_store.get('number').toString()}'),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/home'),
              child: Text('Move to home page'),
            ),
          ],
        )),
      ),
    );
  }
}
