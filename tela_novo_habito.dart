import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'habito.dart';
import 'habitos_store.dart';

class TelaNovoHabito extends StatefulWidget {
  const TelaNovoHabito({super.key});

  @override
  State<TelaNovoHabito> createState() => _TelaNovoHabitoState();
}

class _TelaNovoHabitoState extends State<TelaNovoHabito> {
  final _chave = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _meta = TextEditingController();

  @override
  void dispose() {
    _nome.dispose();
    _meta.dispose();
    super.dispose();
  }

  void _salvar() {
    if (!_chave.currentState!.validate()) return;
    context.read<HabitosStore>().adicionar(Habito(_nome.text, _meta.text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo habito')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _chave,
          child: Column(
            children: [
              TextFormField(
                controller: _nome,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Informe o nome' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _meta,
                decoration: const InputDecoration(
                  labelText: 'Meta',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Informe a meta' : null,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _salvar,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
