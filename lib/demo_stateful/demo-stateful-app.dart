import 'package:eni_flutter_demo/demo_stateful/counter-component.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(DemoStatefulApp());
}

class DemoStatefulApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Stateful",
      home: CounterPage()
    );
  }
}

class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo Counter")),
      body:
        Center(child: CounterWidget(),)
    );
  }
}