import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'habitos_store.dart';
import 'tela_novo_habito.dart';
import 'tela_detalhe_habito.dart';

class TelaHabitos extends StatelessWidget {
  const TelaHabitos({super.key});

  @override
  Widget build(BuildContext context) {
    final habitos = context.watch<HabitosStore>().habitos;

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Habitos')),
      body: ListView.separated(
        itemCount: habitos.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, i) {
          final habito = habitos[i];
          
          return ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: Text(habito.nome),
            subtitle: Text(habito.meta),
            // Ação de clique adicionada aqui
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TelaDetalheHabito(habito: habito),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TelaNovoHabito()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}