import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {

  @override
  State<CounterWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<CounterWidget> {

  // Compteur par défaut
  int counter = 0;

  // Pour incrementer le compteur
  void incrementCounter(){

    counter++;
    
    // Rafraichir la vue
    setState((){

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text("Compteur : ${counter}"),
        ),
        ElevatedButton(onPressed: () { incrementCounter(); }, child: Text("Incrementer"))
      ],
    );
  }
}