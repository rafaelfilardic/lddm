import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'habitos_store.dart';
import 'tela_principal.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => HabitosStore(),
        child: const MeuApp(),
      ),
    );

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diario de Habitos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A5276)),
        useMaterial3: true,
      ),
      home: const TelaPrincipal(),
    );
  }
}

// Foi usada a IA generativa Gemini para ajudar no entendimento e escrita dos códigos.