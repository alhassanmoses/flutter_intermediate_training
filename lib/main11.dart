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
  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _widgetList.add(child);
    }
    super.initState();
  }

  var counter = 0;
  List<Widget> _widgetList = [];

  void _ontapped() {
    Widget child = _newItem(counter);
    setState(() => _widgetList.add(child));
  }

  Widget _newItem(int i) {
    Key key = Key('item_$i}');
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text('$i Name here'),
        deleteButtonTooltipMessage: 'Delete',
        deleteIconColor: Colors.red,
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          child: Text(
            i.toString(),
          ),
        ),
      ),
    );
    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _widgetList.length; i++) {
      Widget child = _widgetList.elementAt(i);
      if (child.key == key) {
        setState(() {
          _widgetList.removeAt(i);
          print('Removed widget ${key.toString()}');
        });
      }
    }
  }

//  void _onPressed() => setState((){} );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('InterMediate Course App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _ontapped,
          child: Icon(Icons.add),
        ),
        body: Center(
            child: Column(
          children: _widgetList,
        )));
  }
}
