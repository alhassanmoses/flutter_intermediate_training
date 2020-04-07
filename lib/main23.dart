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
  @override
  void initState() {
    _current = 0;
    _steps = [
      Step(
        title: Text('Step 1'),
        content: Text('Does Nothing'),
        isActive: true,
      ),
      Step(
        title: Text('Step 2'),
        content: Text('Does Nothing'),
        isActive: true,
      ),
      Step(
        title: Text('Step 3'),
        content: Text('Does Nothing'),
        isActive: true,
      ),
    ];
    super.initState();
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if (_current >= _steps.length) _current = _steps.length - 1;
    });
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
            steps: _steps,
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
