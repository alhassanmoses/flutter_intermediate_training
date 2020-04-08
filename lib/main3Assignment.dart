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
  List<Sales> _cats;
  List<Sales> _dogs;
  List<Sales> _lizards;
  List<Sales> _birds;
  List<charts.Series<Sales, String>> _chartData;

  void _makeData() {
    _cats = List<Sales>();
    _dogs = List<Sales>();
    _birds = List<Sales>();
    _lizards = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();
    final rnd = Random();
    for (int i = 2018; i < 2021; i++) {
      _cats.add(Sales(i.toString(), rnd.nextInt(1000)));
      _dogs.add(Sales(i.toString(), rnd.nextInt(1000)));
      _birds.add(Sales(i.toString(), rnd.nextInt(1000)));
      _lizards.add(Sales(i.toString(), rnd.nextInt(1000)));
    }

    _createCharts(_cats, (_, __) => charts.MaterialPalette.green.shadeDefault);
    _createCharts(_dogs, (_, __) => charts.MaterialPalette.red.shadeDefault);
    _createCharts(_birds, (_, __) => charts.MaterialPalette.gray.shadeDefault);
    _createCharts(
        _lizards, (_, __) => charts.MaterialPalette.yellow.shadeDefault);
  }

  void _createCharts(List data, Function clfn) {
    _chartData.add(
      charts.Series(
        id: 'Sales',
        data: data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        displayName: 'Sales',
        colorFn: clfn,
      ),
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
              Text('Animal Sales'),
              Expanded(
                child: charts.BarChart(
                  _chartData,
                  vertical: false,
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
