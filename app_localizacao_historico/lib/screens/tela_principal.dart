import 'package:flutter/material.dart';
import '../database/db.dart';
import '../localizacao/geo.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Map<String, dynamic>> _localizacoes = [];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
