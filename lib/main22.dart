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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = TabController(length: _items.length, vsync: this);
    super.initState();
  }

  TabController _controller;
  List<TabChoice> _items = const <TabChoice>[
    const TabChoice(title: 'Car', icon: Icons.directions_car),
    const TabChoice(title: 'Bicycle', icon: Icons.directions_bike),
    const TabChoice(title: 'Boat', icon: Icons.directions_boat),
    const TabChoice(title: 'Bus', icon: Icons.directions_bus),
    const TabChoice(title: 'Train', icon: Icons.directions_railway),
    const TabChoice(title: 'Walk', icon: Icons.directions_walk),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: TabPageSelector(
                controller: _controller,
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(48.0),
        ),
        title: Text('live temp'),
      ),
      body: TabBarView(
          controller: _controller,
          children: _items.map((TabChoice item) {
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(children: <Widget>[
                  Text(
                    item.title,
                  ),
                  Icon(
                    item.icon,
                    size: 120.0,
                  )
                ]),
              ),
            );
          }).toList()),
    );
  }
}

class TabChoice {
  final String title;
  final IconData icon;
  const TabChoice({this.title, this.icon});
}
