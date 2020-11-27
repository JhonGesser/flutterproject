import 'package:projeto_edusoft/modelos/RacaModelo.dart';

class RacasModelo {
  List<RacaModelo> racasCachorro = List<RacaModelo>();

  RacasModelo({this.racasCachorro});

  factory RacasModelo.fromJson(Map<String, dynamic> json) => _RacasFromJson(json);
}

RacasModelo _RacasFromJson (Map<String, dynamic> json) {
    return RacasModelo(racasCachorro: _converteListaRacas(json['message']));
}

List<RacaModelo> _converteListaRacas(List racasMap) {
  if (racasMap == null) {
    return null;
  }

  List<RacaModelo> racas = List<RacaModelo>();
  racasMap.forEach((element) { 
    racas.add(new RacaModelo(element));
  });
  return racas;
}