import 'dart:math';

import 'package:flutter/material.dart';
// import '../database/db.dart';
// import '../localizacao/geo.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Map<String, dynamic>> localizacoes = [];
  String textLegal = "Números aparecem aqui as vezes";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg",
        ),
        Image.network(
          "https://cdn.nba.com/headshots/nba/latest/1040x760/2544.png",
        ),
        Image.network(
          "https://i.pinimg.com/736x/c2/a9/b5/c2a9b58b94a130594e0b5f7bddb22293.jpg",
        ),
        Image.network(
          "https://media1.tenor.com/m/jdHZfMGN4BwAAAAC/6-7-6-7-meme.gif",
        ),
        Text(textLegal),
        TextButton(
          onPressed: () {
            setState(() {
              textLegal = "Novo número: ${Random().nextInt(1000)}";
            });
          },
          child: Text("Mudar número"),
        ),
      ],
    );
  }
}
