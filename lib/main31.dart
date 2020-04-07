import 'dart:math';
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
  List<charts.Series<Sales, String>> _chartData;

  void _makeData() {
    _data = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();
    final rnd = Random();
    for (int i = 2010; i < 2021; i++) {
      _data.add(
        Sales(
          i.toString(),
          rnd.nextInt(1000),
        ),
      );
    }
    _chartData.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          data: _data,
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sales,
          fillPatternFn: (_, __) => charts.FillPatternType.forwardHatch,
          displayName: 'Sales'),
    );
  }

  @override
  void initState() {
    _makeData();
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
              Text('Sales Data'),
              Expanded(
                child: charts.BarChart(
                  _chartData,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}
