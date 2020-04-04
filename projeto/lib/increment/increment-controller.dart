import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class IncrementController implements BlocBase{
  
  //Usando o BehaviorSubject, não é necessário declarar a váriavel
  //var _counter = 0;

  //Fluxo da variavel counter
  var _counterController = BehaviorSubject<int>(seedValue: 0);
  // Stream<int> get outCounter {
  //   return _counterController.stream;
  // }

  //OU - quando for apenas 1 linha

  Stream<int> get outCounter => _counterController.stream;
  
  Sink<int> get inCounter => _counterController.sink;
  
  void increment(){
    //Usando o BehaviorSubject, não é necessario seguir com o código assim
    //_counter++;
    //inCounter.add(_counter);


    //Após ter inserido o BehaviorSubject
    inCounter.add(_counterController.value+1);
  }
  
  @override
  void dispose() {
    _counterController.close();
  }  
}