import 'package:eni_flutter_demo/demo_stateful/counter-component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

void main(){
  runApp(DemoFormApp());
}

class DemoFormApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // set json file directory
    // default value is ['lib/i18n']
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
        // Les services de localization
        localizationsDelegates: [
          // delegate from flutter_localization
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // delegate from localization package.
          LocalJsonLocalization.delegate,
        ],
        // Callback pour déterminer la langue utilisée par défaut
        localeResolutionCallback: (locale, supportedLocales) {
          // default language
          return Locale('fr', 'FR');
        },
      title: "Demo Form",
      home: FormPage()
    );
  }
}

class FormPage extends StatelessWidget {

  // Association de la référence d'un formulaire
  var formKey = GlobalKey<FormState>();

  void onSubmit(){
    // Enclencher la validation et retourn "True" si aucune erreur
    if (this.formKey.currentState!.validate()){
      print("Formulaire valide");
    }
  }

  String? emailValidator(String? value){
    // Erreur : Vide
    if (value!.isEmpty) {
      // message traduit
      return 'email.error.empty'.i18n();
    }

    // Erreur : 3 length
    if (value!.length < 4){
      return "L'email doit au moins avoir 3 caractères";
    }

    // Errur si regex email invalide
    if (!RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value!)){

      return 'email.error.regex'.i18n();
    }

    // Retour null aucune erreur
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo Form")),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              validator: emailValidator,
              decoration: InputDecoration(labelText: "Email"),),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onSubmit, child: Text("Submit")))
          ],
        ),
      )
    );
  }
}