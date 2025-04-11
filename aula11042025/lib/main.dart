// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const Colunas());
}

class Colunas extends StatelessWidget {
  const Colunas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trabalhando com colunas",
      home: HomeColunas(),
    );
  }
}

class HomeColunas extends StatelessWidget {
  const HomeColunas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),  
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
