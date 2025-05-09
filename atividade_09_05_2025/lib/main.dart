import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BoloHomePage());
  }
}

class BoloHomePage extends StatelessWidget {
  const BoloHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bolo App")),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 20.0,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blueGrey,
              child: Text(
                "Bem vindo ao Bolo App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Text(
                "lorem ipsun dolor sit",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                  Text("Avaliações"),
                ],
              ),
            ),
            Container(
              color: Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [Icon(Icons.circle), Text("A"), Text("D")]),
                  Column(children: [Icon(Icons.circle), Text("B"), Text("E")]),
                  Column(children: [Icon(Icons.circle), Text("C"), Text("F")]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
