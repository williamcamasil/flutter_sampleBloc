import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:projeto/increment/increment-controller.dart';
import 'increment/increment-widget.dart';

void main(){
  runApp(MaterialApp(
    //O provedor com o tipo
    home: BlocProvider<IncrementController>(
      //Onde será implementado
      child: TestBloc(),
      //Qual tipo de bloc será implementado
      bloc: IncrementController(),
    ),
  ));
}