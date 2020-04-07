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
  List<Step> _steps;
  int _current;
  TextEditingController _nameTextController;
  TextEditingController _ageTextController;
  String name;
  String age;
  bool _valid = false;
  @override
  void initState() {
    _current = 0;

    super.initState();
  }

  void _stepContinue() {
    if (_valid == true) {
      setState(() {
        _current++;
        if (_current >= _steps.length) _current = _steps.length - 1;
      });
    }
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if (_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
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
          child: Stepper(
            steps: [
              Step(
                title: Text('Please enter your name...'),
                content: TextField(
                  onChanged: (val) {
                    name = val;
                  },
                ),
                isActive: true,
              ),
              Step(
                title: Text('Please enter your age...'),
                content: TextField(
                  onChanged: (val) {
                    age = val;
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                isActive: true,
              ),
              Step(
                title: Text('Verify your details'),
                content: Text(
                  name == null || age == null
                      ? 'No data provided'
                      : 'Name: $name and Age: ${int.parse(age)}',
                ),
                isActive: true,
              ),
            ],
            type: StepperType.vertical,
            currentStep: _current,
            onStepCancel: _stepCancel,
            onStepContinue: _stepContinue,
            onStepTapped: _stepTap,
          ),
        ),
      ),
    );
  }
}
