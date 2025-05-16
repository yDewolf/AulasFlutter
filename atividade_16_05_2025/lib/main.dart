import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agenda de estudos")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: IntrinsicWidth(
            child: Column(
              spacing: 20.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 10.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Busque conteúdos comuns",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SearchBar(),
                  ],
                ),
                IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20.0,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 20.0,
                        children: [
                          ButtonWithText(text: "História", icon: Icons.book),
                          ButtonWithText(
                            text: "Matemática",
                            icon: Icons.numbers,
                          ),
                          ButtonWithText(
                            text: "Língua Portuguesa",
                            icon: Icons.language,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 20.0,
                        children: [
                          ButtonWithText(text: "Geografia", icon: Icons.map),
                          ButtonWithText(
                            text: "Biologia",
                            icon: Icons.bug_report,
                          ),
                          ButtonWithText(text: "Química", icon: Icons.circle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 20.0,
                        children: [
                          ButtonWithText(
                            text: "Física",
                            icon: Icons.arrow_downward,
                          ),
                          ButtonWithText(text: "Artes", icon: Icons.color_lens),
                          ButtonWithText(text: "Filosofia", icon: Icons.search),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class ButtonWithText extends StatelessWidget {
  String text;
  IconData icon = Icons.circle;
  VoidCallback? onPressed;
  ButtonWithText({
    required this.text,
    required this.icon,
    super.key,
    this.onPressed,
  });

  @override
  Column build(BuildContext context) {
    onPressed ??= () => {};
    const double SIZE = 32.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: SIZE + 16.0,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(icon, size: SIZE, color: Colors.white),
            ),
          ),
        ),
        Text(text, textAlign: TextAlign.justify),
      ],
    );
  }
}
