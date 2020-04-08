import 'package:flutter/material.dart';

import './assignment_4_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name;

  void _onPressed(String val) {
    setState(() {
      name = val;
    });
  }

  bool _isAuthenticated;

  void _onAuthenticated(bool value) {
    setState(() => _isAuthenticated = value);
  }

  @override
  void initState() {
    _isAuthenticated = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('live temp'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Ass4Widget(_onPressed),
              Text(
                'Name as displayed on parent widget is: $name',
              ),
//              TimeCounter(),
            ],
          ),
        ),
      ),
    );
  }
}
