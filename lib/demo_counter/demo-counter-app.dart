import 'package:eni_flutter_demo/demo_counter/counter-page-2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter-provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
  ], child: DemoCounterApp()));
}

class DemoCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Demo App", routes: {
      '/': (_) => DemoCounterPage(),
      '/page-2': (_) => CounterPage2(),
    });
  }
}

class DemoCounterPage extends StatelessWidget {
  void onClick(BuildContext context) {
    // Je veux récupérer le singleton du counter provider
    CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    // Pour appeler sa méthode incrementer
    counterProvider.incrementer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("La page counter"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  onClick(context);
                },
                child: Text("Incrementer")),
            // j'écoute les changements de CounterProvider
            Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
              return Text("Counter : ${counterProvider.counter}");
            }),
            // j'écoute les changements de CounterProvider
            Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("Coucou tu veux voir mes chocolatines ?"),
                    Text("Counter Test 2 : ${counterProvider.counter}"),
                    Icon(Icons.ice_skating)
                  ],
                ),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/page-2");
                },
                child: Text("Ouvrir page 2")),
          ],
        ),
      ),
    );
  }
}
