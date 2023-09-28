import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter-provider.dart';

class CounterPage2 extends StatelessWidget {

  void increment(){
    int counter = 0;
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("La page counter 2"),),
      body: Center(
        child: Column(
          children: [
            Consumer<CounterProvider>(builder: (context, counterProvider, child) {
              return Text("Counter : ${counterProvider.counter}");
            }),
            ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false).incrementer();
                },
                child: Text("Incrementer")),
          ],
        ),
    ));
  }

}