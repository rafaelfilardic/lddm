import 'package:flutter/foundation.dart';

import 'habito.dart';

/// A lista de habitos vive aqui, acima das telas.
/// Estado do fim da pratica de estado compartilhado.
class HabitosStore extends ChangeNotifier {
  final List<Habito> _habitos = [
    const Habito('Beber agua', 'Meta: 8 copos por dia'),
    const Habito('Ler', 'Meta: 20 paginas por dia'),
    const Habito('Caminhar', 'Meta: 30 minutos por dia'),
  ];

  List<Habito> get habitos => List.unmodifiable(_habitos);

  void adicionar(Habito h) {
    _habitos.add(h);
    notifyListeners();
  }

  void priorizar(Habito h) {
    final index = _habitos.indexOf(h);
    if (index > 0) {
      _habitos.removeAt(index);
      _habitos.insert(0, h);
      notifyListeners();
    }
  }
}
