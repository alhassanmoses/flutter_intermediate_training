import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  final ValueChanged<bool> onAuthenticated;
  Authenticator({Key key, this.onAuthenticated});
  @override
  _AuthenticatorState createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  TextEditingController _user;
  TextEditingController _password;
  void _onPressed() {
    if (_user.text != 'user' || _password.text != '1234') {
      widget.onAuthenticated(false);
    } else {
      widget.onAuthenticated(true);
    }
  }

  @override
  void initState() {
    _password = TextEditingController();
    _user = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _user,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: _onPressed,
                child: Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
