import 'package:flutter/material.dart';

void main() {
  runApp(AppDemo());
}


// L'application
class AppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Eni Demo", // Le titre de l'application
      home: HomePage(), // La page par défaut
    );
  }
}

// C'est une page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ma page")),
      body: Flex(direction: Axis.vertical, children: [
        Row(children: [
          Text("Col 1"),
          Expanded(child: Text("Col 2", textAlign: TextAlign.center,)),
          Text("Col 3"),
        ]),
        Expanded(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Text("Ligne 1", style: TextStyle(color: Color(0xFF58B0F0)),),
            ),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text("Un Bouton"))),
            Expanded(child: Text("Ligne 2")),
            Text("Ligne 3")
          ]),
        ),
      ]),
    );
  }
}
