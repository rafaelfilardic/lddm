import 'package:flutter/material.dart';

import 'cat_store.dart';

void main() {
  runApp(const MeuAppDeGatos());
}

class MeuAppDeGatos extends StatelessWidget {
  const MeuAppDeGatos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerador de Gatos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const TelaGato(),
    );
  }
}

class TelaGato extends StatefulWidget {
  const TelaGato({super.key});

  @override
  State<TelaGato> createState() => _TelaGatoState();
}

class _TelaGatoState extends State<TelaGato> {
  final CatStore _store = CatStore();

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gato Aleatório'), centerTitle: true),
      body: ListenableBuilder(
        listenable: _store,
        builder: (context, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _construirConteudo(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _store.buscarGato,
        icon: const Icon(Icons.pets),
        label: const Text('Outro Gato'),
      ),
    );
  }

  Widget _construirConteudo() {
    switch (_store.estado) {
      case TelaEstado.carregando:
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Atraindo um gato...'),
          ],
        );

      case TelaEstado.erro:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              _store.mensagemErro,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        );

      case TelaEstado.vazio:
        return const Text('Nenhum gatinho encontrado. Tente novamente.');

      case TelaEstado.sucesso:
        final gato = _store.catAtual!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                gato.url,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 300,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'ID: ${gato.id}',
              style: Theme.of(context).textTheme.labelLarge
                  ?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        );
    }
  }
}

// Foi usada a IA generativa Gemini para ajudar no entendimento e escrita dos códigos
