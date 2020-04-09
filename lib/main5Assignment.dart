import 'package:flutter/material.dart';
import './second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      routes: {
        '/second': (context) => SecondPage(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('live temp'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).pushNamed('/second'),
            child: Text('Move to Second Page'),
          ),
        ),
      ),
    );
  }
}
