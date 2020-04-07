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
  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      _items.add(
        MyItems(
          false,
          'Item $i',
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('item $i expanded'),
          ),
        ),
      );
    }
    super.initState();
  }

  List<MyItems> _items = [];
  ExpansionPanel _createItem(MyItems item) {
    return ExpansionPanel(
      headerBuilder: (
        context,
        isExpanded,
      ) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Header ${item.header}'),
        );
      },
      body: item.body,
      isExpanded: item.isExpanded,
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
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createItem).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class MyItems {
  final String header;
  final Widget body;
  bool isExpanded;
  MyItems(this.isExpanded, this.header, this.body);
}
