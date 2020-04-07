import 'dart:math';

import 'package:flutter/material.dart';

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
  int _location;
  List<Area> _areas;
  @override
  void initState() {
    _areas = [];
    for (int i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: 'Area $i'));
    }
    var rng = Random();
    _location = rng.nextInt(_areas.length);
    super.initState();
  }

  void _onPressed(int index) {
    setState(() {
      index == _location
          ? _areas[index].color = Colors.blue
          : _areas[index].color = Colors.red;
    });
  }

  Widget _buildWidgets(int index) {
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          onPressed: () => _onPressed(index),
          color: _areas[index].color,
          child: Text(
            _areas[index].name,
//            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
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
          child: GridView.count(
            crossAxisCount: 4,
            children: List<Widget>.generate(16, _buildWidgets),
          ),
        ),
      ),
    );
  }
}

class Area {
  int index;
  String name;
  Color color;
  Area({
    this.index: -1,
    this.name: 'Area',
    this.color: Colors.green,
  });
}
