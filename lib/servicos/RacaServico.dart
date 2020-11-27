import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_edusoft/modelos/RacasModelo.dart';

Future<RacasModelo> buscaCachorros() async {
  final response = await http.get('https://dog.ceo/api/breeds/list');

  if (response.statusCode == 200) { 
    return RacasModelo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Não foi possível carregar as raças');
  }

}