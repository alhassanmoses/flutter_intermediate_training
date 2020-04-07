import 'dart:math';
import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;

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
  List<Sales> _data;
  List<charts.Series<Sales, int>> _chartData;
  @override
  void initState() {
    _makeData();
    super.initState();
  }

  void _makeData() {
    _chartData = List<charts.Series<Sales, int>>();
    _data = <Sales>[
      Sales(0, 100, charts.MaterialPalette.red.shadeDefault),
      Sales(1, 68, charts.MaterialPalette.green.shadeDefault),
      Sales(2, 23, charts.MaterialPalette.gray.shadeDefault),
      Sales(3, 7, charts.MaterialPalette.yellow.shadeDefault),
    ];
    _chartData.add(charts.Series(
      id: 'Sales',
      data: _data,
      colorFn: (Sales sales, _) => sales.color,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
    ));
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
              Text('Sales Data'),
              Expanded(
                  child: charts.PieChart<int>(
                _chartData,
                animate: true,
                animationDuration: Duration(seconds: 2),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Sales {
  int year;
  int sales;
  charts.Color color;
  Sales(this.year, this.sales, this.color);
}
