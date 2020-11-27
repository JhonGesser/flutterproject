import 'package:flutter/material.dart';
import 'package:projeto_edusoft/modelos/RacaModelo.dart';
import 'package:projeto_edusoft/modelos/RacasModelo.dart';
import 'package:projeto_edusoft/servicos/RacaServico.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key:key);
  
  @override
  _MyAppStage createState() => _MyAppStage();
  
}

class _MyAppStage extends State<MyApp> {
  Future<RacasModelo> futureRacasModelo;
  @override
  void initState() {
    futureRacasModelo = buscaCachorros();
  }  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raças de cachorro',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Raças de cachorro'),
        ),
        body: Center(
          child: FutureBuilder<RacasModelo>(
            future: futureRacasModelo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _constroiLista(context, snapshot.data.racasCachorro);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Widget _constroiLista (BuildContext context, List<RacaModelo> racasCachorro) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: racasCachorro.map((data) => _constroiItemLista(context, data)).toList(),
  );
}

Widget _constroiItemLista (BuildContext context, RacaModelo racaModelo) {
  final nome = racaModelo.nomeRaca;
  if (nome == null) {
    return Container();
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: InkWell(
      child: Row(
        children: <Widget> [
          Expanded(child:  Text(nome))
        ]
      ),
    ),
  );
}
