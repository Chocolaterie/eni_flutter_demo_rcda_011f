import 'package:eni_flutter_demo/demo_form/validator-helper.dart';
import 'package:eni_flutter_demo/demo_stateful/counter-component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(DemoFormApp());
}

enum CounterEvent {increment, decrement}

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) =>  {
      if (event == CounterEvent.increment){
        emit(state + 1)
      }
      else {
        emit(state - 1)
      }
    });
  }
}

class DemoFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
          title: "Demo Form",
          home: FormPage()),
    );
  }
}

class FormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("BLOC"),),
      body: Center(
        child: Column(children: [
          Text("Test"),
          BlocBuilder<CounterBloc, int>(builder: (context, count) {
            return Text("Counter : $count");
          }),
          ElevatedButton(onPressed: () {
            context.read<CounterBloc>().add(CounterEvent.increment);
          }, child: Text("Increment Counter"))
        ],),
      ),
    );
  }

}