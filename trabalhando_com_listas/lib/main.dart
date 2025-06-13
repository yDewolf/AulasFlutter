import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trabalhando com listas",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trabalhando com listas")),
      body: ListView(
        children: [
          ListItemRow(),
          ListItemRow(),
          ListItemRow(),
          ListItemRow(),
          ListItemRow(),
          ListItemRow(),
          ListItemRow(),
          ListItemRow(),
        ],
      ),
    );
  }
}

class MainListView extends StatelessWidget {
  const MainListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
        
      ],
    );
  }
}

class ListItemRow extends StatelessWidget {
  const ListItemRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
            Icon(Icons.home),
            Text("Item"),
          ],
        ),
      ],
    );
  }
}
