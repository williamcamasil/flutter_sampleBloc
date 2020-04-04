
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:projeto/increment/increment-controller.dart';

class TestBloc extends StatefulWidget {
  @override
  _TestBlocState createState() => _TestBlocState();
}

class _TestBlocState extends State<TestBloc> {

  //int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print("Construindo Widget");
    
    //Bloc instanciado sem a necessidade de usar singletom
    //Apartir daqui será possível usar todos os métodos que forem criado na incrementcontroller
    final IncrementController bloc = BlocProvider.of<IncrementController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("BLOC"),
      ),

      body: Center(
        child: StreamBuilder(
          //Fluxo
          //Strem de saída
          stream: bloc.outCounter,
          //Inserindo o valor inicial
          //initialData: 0, //Se usar o BehaviorSubject não precisa dessa linha 
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return Text("Tocou no botão add ${snapshot.data} vezes");
          }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Chamando o método
          bloc.increment();
        },
      ),
    );
  }
}