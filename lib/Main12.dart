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
  var _value = 0.0;
//  DateTime timer = DateTime
  void _onChanged(double value) => setState(() => _value = value);

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
              Slider(
                value: _value,
                onChanged: _onChanged,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: LinearProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                  value: _value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
