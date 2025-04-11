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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://pbs.twimg.com/media/FnQJKQuWAAkcCjf.jpg:large",
              height: 128,
              width: 128,
            ),
            Text("Login"),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                print("Botão pressioando");
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
