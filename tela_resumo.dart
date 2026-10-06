import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'habitos_store.dart';

class TelaResumo extends StatelessWidget {
  const TelaResumo({super.key});

  @override
  Widget build(BuildContext context) {
    final habitos = context.watch<HabitosStore>().habitos;

    return Scaffold(
      appBar: AppBar(title: const Text('Resumo')),
      body: Center(
        child: Text(
          '${habitos.length} habitos cadastrados',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
