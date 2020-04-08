import 'package:flutter/material.dart';

class Ass4Widget extends StatefulWidget {
  Function onPressed;
  Ass4Widget(this.onPressed);
  @override
  _Ass4WidgetState createState() => _Ass4WidgetState();
}

class _Ass4WidgetState extends State<Ass4Widget> {
  String tempName;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          onChanged: widget.onPressed,
          decoration: InputDecoration(
            labelText: 'Name',
          ),
        ),
      ),
    );
  }
}
