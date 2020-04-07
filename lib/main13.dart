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

enum Animals { Cat, Dog, Bird, Lizard, Fish }

class _MyHomePageState extends State<MyHomePage> {
  List<PopupMenuEntry<Animals>> _items = [];
  Animals _selectedAnimal;
  @override
  void initState() {
    for (Animals animal in Animals.values) {
      _items.add(
        PopupMenuItem(
          value: animal,
          child: Text(
            _getDisplay(animal),
          ),
        ),
      );
    }
    super.initState();
  }

  String _value = 'Make a selection';

  void _onSelected(Animals animal) {
    setState(() {
      _selectedAnimal = animal;
      _value = 'You selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
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
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  _value,
                ),
              ),
              PopupMenuButton<Animals>(
                itemBuilder: (context) {
                  return _items;
                },
                child: Icon(
                  Icons.input,
                ),
                initialValue: Animals.Cat,
                onSelected: _onSelected,
              )
            ],
          ),
        ),
      ),
    );
  }
}
