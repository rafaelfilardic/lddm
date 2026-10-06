import 'package:flutter/material.dart';

import 'tela_habitos.dart';
import 'tela_resumo.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _aba = 0;

  final _telas = const [
    TelaHabitos(),
    TelaResumo(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _telas[_aba],
        bottomNavigationBar: _barra(),
      );

  Widget _barra() => NavigationBar(
        selectedIndex: _aba,
        onDestinationSelected: (i) => setState(() => _aba = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: 'Habitos'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Resumo'),
        ],
      );
}
