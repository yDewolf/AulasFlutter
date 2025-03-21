// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PrimeiraTela());
}

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu titulo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ZapZap",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("oi");
              },
              icon: Icon(Icons.add_home_work),
            ),
          ],
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.black,
            padding: EdgeInsets.all(10),

            child: Center(
              child: const Text(
                "Eu quando a engrenagem está sólida",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
