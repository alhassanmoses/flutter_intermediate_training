import 'dart:async';

import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  Duration duration = Duration();
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;
  TimeDisplay({Key key, this.color, this.duration, this.onClear})
      : super(key: key);

  void _onPressed() {
    onClear(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            duration.toString(),
            style: TextStyle(
              fontSize: 30.0,
              color: color,
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: _onPressed,
        ),
      ],
    );
  }
}
