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
        title: Text("Imagens em coluna", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Image.network(
                "https://pbs.twimg.com/media/FnQJKQuWAAkcCjf.jpg:large",
                height: 128,
                width: 128,
              ),
              Image.network(
                "https://pbs.twimg.com/media/FnQJKQuWAAkcCjf.jpg:large",
                height: 128,
                width: 128,
              ),
              Image.network(
                "https://pbs.twimg.com/media/FnQJKQuWAAkcCjf.jpg:large",
                height: 128,
                width: 128,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
