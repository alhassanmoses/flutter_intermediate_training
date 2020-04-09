import 'package:flutter/material.dart';
import './global_state.dart';
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
  GlobalState _store = GlobalState.instance;
  int _count = 0;
  @override
  void initState() {
    _store.set('number', _count);
//    String temp;

    super.initState();
  }

  void _onPressed() {
    setState(() {
      _store.set('number', _count);
      Navigator.of(context).pushNamed('/second');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment 6'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Increase or decrese value',
            ),
            Text(
              _count.toString(),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() => _count++);
                  },
                  icon: Icon(Icons.add),
                ),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  onPressed: () {
                    setState(() => _count--);
                  },
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _store.set('number', _count);
                  Navigator.of(context).pushNamed('/second');
                });
              },
              child: Text('Second page'),
            )
          ],
        ),
      ),
    );
  }
}
