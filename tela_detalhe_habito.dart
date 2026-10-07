import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'habito.dart';
import 'habitos_store.dart';

class TelaDetalheHabito extends StatelessWidget {
  final Habito habito;

  const TelaDetalheHabito({super.key, required this.habito});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Hábito')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              habito.nome,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              habito.meta,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  context.read<HabitosStore>().priorizar(habito);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_upward),
                label: const Text('Priorizar Hábito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
