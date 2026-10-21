import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'cat_model.dart';

enum TelaEstado { vazio, carregando, sucesso, erro }

class CatStore extends ChangeNotifier {
  TelaEstado estado = TelaEstado.vazio;
  CatImage? catAtual;
  String mensagemErro = '';

  CatStore() {
    buscarGato();
  }

  Future<void> buscarGato() async {
    estado = TelaEstado.carregando;
    mensagemErro = '';
    notifyListeners();

    try {
      final url = Uri.parse('https://api.thecatapi.com/v1/images/search');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);

        if (dados.isNotEmpty) {
          catAtual = CatImage.fromMap(dados[0]);
          estado = TelaEstado.sucesso;
        } else {
          estado = TelaEstado.vazio;
        }
      } else {
        estado = TelaEstado.erro;
        mensagemErro = 'Erro no servidor: ${response.statusCode}';
      }
    } catch (e) {
      estado = TelaEstado.erro;
      mensagemErro = 'Falha na conexão. Verifique sua internet.';
    }

    notifyListeners();
  }
}
