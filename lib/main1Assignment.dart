import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(duration, _timeUp);
    super.initState();
  }

  var _time = 0.0;
//  DateTime timer = DateTime
  static Duration duration = Duration(milliseconds: 100);

  bool _running = false;

  void _timeUp(Timer timer) {
    if (!_running) {
      return;
    }
    setState(() {
      _time += 0.01;
      if (_time >= 1.0) {
        _running = false;
//        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InterMediate Course App'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
//              Slider(
//                value: _time,
//                onChanged: _onChanged,
//              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: LinearProgressIndicator(
                  value: _time,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                  value: _time,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    _time = 0.0;
                    _running = true;
                  });
                },
                child: Text('Hit Me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
