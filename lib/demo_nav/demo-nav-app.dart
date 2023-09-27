import 'package:flutter/material.dart';

void main() {
  runApp(DemoNavApp());
}

class DemoNavApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Demo Nav",
        initialRoute: '/',
        routes: {
          '/': (context) => PageOne(),
          '/second-page': (context) => PageTwo(),
    });
  }
}

class PageOne extends StatelessWidget {

  void onClickBtn(BuildContext context){
    Navigator.pushNamed(context, "/second-page");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(child: Column(
        children: [
          Text("Page Une"),
          ElevatedButton(onPressed: () { onClickBtn(context); }, child: Text("Changer de page"))
        ],
      )),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(child: Text("Page Two")),
    );
  }
}
