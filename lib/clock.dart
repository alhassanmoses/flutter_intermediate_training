import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ClockState extends StatefulWidget {
  @override
  _ClockStateState createState() => _ClockStateState();
}

class _ClockStateState extends State<ClockState> {
  String _value = 'Time here';
  Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), _onTimer);

    super.initState();
  }

  void _onTimer(Timer timer) {
    String formatted = DateFormat('hh:mm:ss').format(DateTime.now());
    setState(() => _value = formatted);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _value,
      style: TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
