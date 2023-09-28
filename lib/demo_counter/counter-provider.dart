import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {

  int counter = 0;

  void incrementer(){
    counter ++;
    // On va dire à tous les elements qui nous écoutent
    // => on a changé (précisement la valeur du compteur)
    notifyListeners();
  }
}