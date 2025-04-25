// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static const text_style = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Desafio de 25/04/2025")),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IntrinsicWidth(
                child: Column(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.0),

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 215, 226),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text("André Young", style: text_style),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 215, 226),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          "O famoso youtuber, lutador, biólogo e rei das tier lists",
                          style: text_style,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 215, 226),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            Text("21 Reviews", style: text_style),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 193, 215, 226),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.align_horizontal_left_rounded),
                              Text("Tier lists", style: text_style),
                              Text("sempre", style: text_style),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.bug_report_outlined),
                              Text("Biologia", style: text_style),
                              Text("as vezes", style: text_style),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.pets),
                              Text("Super Auto Pets", style: text_style),
                              Text("toda segunda feira", style: text_style),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Image.network(
                height: 300,
                width: 300,
                "https://i.ytimg.com/vi/5ct2t-NWTnc/maxresdefault.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
